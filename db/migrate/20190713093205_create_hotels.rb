class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.integer :hotel_number
      t.integer :site
      t.string :comment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
