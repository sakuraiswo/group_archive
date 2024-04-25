class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :answer_text
      t.references :user, null: false, foreign_key: true
      t.references :question_sheet, null: false, foreign_key: true
      t.references :option, null: true, foreign_key: true
      t.timestamps
    end
  end
end
