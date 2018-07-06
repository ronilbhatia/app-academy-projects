# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# Poll.destroy_all
# Question.destroy_all
# AnswerChoice.destroy_all
# Response.destroy_all

user1 = User.create(username: 'user1')
user2 = User.create(username: 'user2')
user3 = User.create(username: 'user3')
# User.create({username: 'user4'})
# User.create({username: 'user5'})
# User.create({username: 'user6'})
# User.create({username: 'user7'})
# User.create({username: 'user8'})
# User.create({username: 'user9'})

  
poll1 = Poll.create(title: 'poll1', user_id: user1.id)
poll2 = Poll.create(title: 'poll2', user_id: user2.id)
poll3 = Poll.create(title: 'poll3', user_id: user3.id)
# Poll.create(title: 'poll4', user_id: 4})
# Poll.create({title: 'poll5', user_id: 5})
# Poll.create({title: 'poll6', user_id: 6})
# Poll.create({title: 'poll7', user_id: 7})
# Poll.create({title: 'poll8', user_id: 8})



q1 = Question.create(text: 'question1', poll_id: poll1.id)
q2 = Question.create(text: 'question2', poll_id: poll2.id)
q3 = Question.create(text: 'question3', poll_id: poll3.id)
# q4 = Question.create(text: 'question4', poll_id: poll1.id)
# q5 = Question.create(text: 'question5', poll_id: poll2.id)
# q6 = Question.create(text: 'question6', poll_id: poll3.id)
# q7 = Question.create(text: 'question7', poll_id: poll1.id)
# q8 = Question.create(text: 'question8', poll_id: poll2.id)
# q9 = Question.create(text: 'question9', poll_id: poll3.id)

  
answer_choice = AnswerChoice.create([
    {choice: 'answer1', question_id: 1},
    {choice: 'answer2', question_id: 2},
    {choice: 'answer3', question_id: 3},
    {choice: 'answer4', question_id: 1},
    {choice: 'answer5', question_id: 2},
    {choice: 'answer6', question_id: 3},
    {choice: 'answer7', question_id: 1},
    {choice: 'answer8', question_id: 2},
    {choice: 'answer9', question_id: 3},
    {choice: 'answer10', question_id: 1}
  ])
# 
response = Response.create([
  {question_id: 1, answer_choice_id: 1, user_id: 1},
  {question_id: 2, answer_choice_id: 2, user_id: 2},
  {question_id: 2, answer_choice_id: 3, user_id: 1},
  {question_id: 2, answer_choice_id: 4, user_id: 3},
  {question_id: 3, answer_choice_id: 5, user_id: 1},
  {question_id: 3, answer_choice_id: 6, user_id: 2},
  {question_id: 1, answer_choice_id: 7, user_id: 2},
  {question_id: 2, answer_choice_id: 10, user_id: 3},
  {question_id: 3, answer_choice_id: 8, user_id: 3},
  {question_id: 3, answer_choice_id: 9, user_id: 1}
  ])
# 
    