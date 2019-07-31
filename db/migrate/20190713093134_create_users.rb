class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email,:unique => true
      t.string :password_digest
      t.boolean :admin
      t.string :remember_digest
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.timestamps
    end
  end
end
