require 'sqlite3'
require 'Singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class ModelBase
  attr_reader :id, :table
  
  def self.find_by_id(id, table)
    object = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL
    
    return nil if object.empty?
    
    self.new(object.first)
  end
  
  def save(table)
    # sql_string = <<-SQL, , @id SQL 
    vars = self.instance_variables
    
    strings = vars.map { |var| var.to_s.split('').drop(1).join }
    mod_with_at = strings.map { |var| var + "= ?" }.join(", ") 
    qmarks = strings.map { "?" }.join(", ")
    strings = strings.join(", ")
    vars.map! { |var| instance_variable_get(var.to_s) }
    
    if @id
      QuestionsDatabase.instance.execute("UPDATE #{table} SET #{mod_with_at} WHERE id = ?", vars + [@id])
    else
      QuestionsDatabase.instance.execute("INSERT INTO #{table} (#{strings}) VALUES (#{qmarks})", data)
      
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end
end

class User < ModelBase
  attr_accessor :fname, :lname
  # attr_reader :id
  
  def self.find_by_id(id)
    super(id, 'users')
  end
  # def self.find_by_id(id)
  #   user = QuestionsDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       users
  #     WHERE
  #       id = ?
  #   SQL
  #   return nil if user.empty?
  # 
  #   User.new(user.first)
  # end
  
  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil if user.empty?
    
    User.new(user.first)
  end
  
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
  
  def authored_questions
    Question.find_by_author_id(@id)
  end
  
  def authored_replies
    Reply.find_by_user_id(@id)
  end
  
  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end
  
  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end
  
  def average_karma
    # questions = Question.find_by_author_id(@id)
    # questions.reduce(0) do |sum, question|
    #   sum + question.num_likes
    # end/questions.length.to_f
    
    ave = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        (CAST(COUNT(question_likes.user_id) AS FLOAT) / COUNT(DISTINCT questions.id)) AS average
      FROM
        questions
        LEFT JOIN question_likes ON questions.id = question_likes.question_id
      WHERE
        questions.user_id = @id
    SQL
  end
  
  def save
    super('users')
  end
  # def save
  # 
  #   if @id
  #     QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
  #       UPDATE
  #         users
  #       SET
  #         fname = ?,
  #         lname = ?
  #       WHERE
  #         id = ?
  #     SQL
  #   else
  #     QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
  #       INSERT INTO
  #         users (fname, lname)
  #       VALUES
  #         (?, ?)
  #     SQL
  # 
  #     @id = QuestionsDatabase.instance.last_insert_row_id
  #   end
  # end
end

class Question < ModelBase
  attr_accessor :title, :body, :user_id
  attr_reader :id
  
  def self.find_by_id(id)
    super(id, 'questions')
  end
  # 
  # def self.find_by_id(id)
  #   question = QuestionsDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       questions
  #     WHERE
  #       id = ?
  #   SQL
  #   return nil if question.empty?
  # 
  #   Question.new(question.first)
  # end
  
  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    
    questions.map { |question| Question.new(question) }
  end
  
  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end
  
  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end
  
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end
  
  def author
    User.find_by_id(@user_id)
  end
  
  def replies
    Reply.find_by_question_id(@id)
  end
  
  def followers
    QuestionFollow.followers_for_question_id(@id)
  end
  
  def likers
    QuestionLike.likers.likers_for_question_id(@id)
  end
  
  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end
  
  def save
    super('questions')
  end
  # 
  # def save
  #   if @id
  #     QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
  #       UPDATE
  #         questions
  #       SET
  #         title = ?,
  #         body = ?, 
  #         user_id = ?
  #       WHERE
  #         id = ?
  #     SQL
  #   else
  #     QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
  #       INSERT INTO
  #         questions (title, body, user_id)
  #       VALUES
  #         (?, ?, ?)
  #     SQL
  # 
  #     @id = QuestionsDatabase.instance.last_insert_row_id
  #   end
  # end
end

class Reply < ModelBase
  attr_accessor :body, :parent_id, :user_id, :question_id
  attr_reader :id
  
  def self.find_by_id(id)
    super(id, 'replies')
  end
  
  # def self.find_by_id(id)
  #   reply = QuestionsDatabase.instance.execute(<<-SQL, id)
  #     SELECT
  #       *
  #     FROM
  #       replies
  #     WHERE
  #       id = ?
  #   SQL
  #   return nil if reply.empty?
  # 
  #   Reply.new(reply.first)
  # end
  
  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    
    replies.map { |reply| Reply.new(reply) }
  end
  
  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    
    replies.map { |reply| Reply.new(reply) }
  end
  
  def initialize(options)
    @id = options['id']
    @body = options['body']
    @parent_id = options['parent']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
  
  def author
    User.find_by_id(@user_id)
  end
  
  def question
    Question.find_by_id(@question_id)
  end
  
  def parent_reply
    Reply.find_by_id(@parent_id)
  end
  
  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent = ?
    SQL
  end
  
  def save
    super('replies')
  end
  # def save
  # 
  #   if @id
  #     QuestionsDatabase.instance.execute(<<-SQL, @body, @parent_id, @user_id, @question_id, @id)
  #       UPDATE
  #         replies
  #       SET
  #         body = ?,
  #         parent = ?,
  #         user_id = ?,
  #         question_id = ?
  #       WHERE
  #         id = ?
  #     SQL
  #   else
  #     QuestionsDatabase.instance.execute(<<-SQL, @body, @parent_id, @user_id, @question_id)
  #       INSERT INTO
  #         replies (body, parent, user_id, question_id)
  #       VALUES
  #         (?, ?, ?, ?)
  #     SQL
  # 
  #     @id = QuestionsDatabase.instance.last_insert_row_id
  #   end
  # end
end

class QuestionFollow
  def self.followers_for_question_id(question_id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_follows
        JOIN users on users.id = question_follows.user_id
      WHERE
        question_id = ?
    SQL
    
    follows.map { |user| User.new(user) }
  end
  
  def self.followed_questions_for_user_id(user_id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_follows
        JOIN questions ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL
    
    follows.map { |question| Question.new(question) }
  end
  
  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        question_follows
      JOIN
        questions
      ON
        questions.id = question_follows.question_id
      GROUP BY
        question_follows.question_id
      ORDER BY
        count(question_follows.user_id) desc
      LIMIT
        ?
    SQL
    
    questions.map {|question| Question.new(question)}
  end
end

class QuestionLike
  def self.likers_for_question_id(question_id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        question_likes
        JOIN users on users.id = question_likes.user_id
      WHERE
        question_id = ?
    SQL
    
    follows.map { |user| User.new(user) }
  end
  
  def self.liked_questions_for_user_id(user_id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        question_likes
        JOIN questions ON questions.id = question_likes.question_id
      WHERE
        question_likes.user_id = ?
    SQL
    
    follows.map { |question| Question.new(question) }
  end
  
  def self.num_likes_for_question_id(question_id)
    num_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        count(*) AS num_likes
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    num_likes[0]['num_likes']
  end
  
  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        question_likes
      JOIN
        questions
      ON
        questions.id = question_likes.question_id
      GROUP BY
        question_likes.question_id
      ORDER BY
        count(question_likes.user_id) desc
      LIMIT
        ?
    SQL
    
    questions.map {|question| Question.new(question)}
  end
end