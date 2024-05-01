class CreateMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :memos do |t|
      t.text :my_memo
      t.text :my_icon
      t.text :user1_memo
      t.text :user2_memo
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
