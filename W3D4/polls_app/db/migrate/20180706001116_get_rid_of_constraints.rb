class GetRidOfConstraints < ActiveRecord::Migration[5.1]
  def change
    remove_index :responses, :answer_choice_id
    remove_index :responses, :question_id
  end
end
