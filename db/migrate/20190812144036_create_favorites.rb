class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :number
      t.string :name
      t.string :memo
      t.integer :site,default:0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
