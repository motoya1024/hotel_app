class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :number
      t.integer :site,default:1
      t.string :name
      t.string :comment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
