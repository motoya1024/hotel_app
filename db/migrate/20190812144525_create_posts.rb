class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :number
      t.string :name
      t.string :comment
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
