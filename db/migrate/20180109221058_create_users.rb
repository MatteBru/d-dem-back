class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :party
      t.string :gender
      t.string :religion
      t.string :education

      t.timestamps
    end
  end
end
