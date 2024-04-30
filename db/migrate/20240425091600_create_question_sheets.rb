class CreateQuestionSheets < ActiveRecord::Migration[7.0]
  def change
    create_table :question_sheets do |t|
      t.text :question, null: false
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
