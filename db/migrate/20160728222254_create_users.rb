class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :password_digest
      t.string :cc_number

      t.timestamps
    end
  end
end
