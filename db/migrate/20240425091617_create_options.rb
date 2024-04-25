class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.text :title
      t.references :question_sheet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
