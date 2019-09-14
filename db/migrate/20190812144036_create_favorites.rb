class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :number
      t.string :name
      t.string :memo
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
