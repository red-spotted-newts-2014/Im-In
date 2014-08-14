class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|

      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :phone_number
      t.string :email,           null: false, default: ""
      t.string :password_digest, null: false, default: ""

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
