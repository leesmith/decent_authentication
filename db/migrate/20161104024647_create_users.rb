class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :auth_token
      t.string :password_digest
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.boolean :enabled, default: false, null: false
      t.timestamps
    end

    add_index :users, :email
    add_index :users, :auth_token
  end
end
