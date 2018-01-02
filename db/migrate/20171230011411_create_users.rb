class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :color
      t.string :bio
      t.string :email
      t.datetime :birth_date
      t.string :gender

      t.timestamps
    end
  end
end
