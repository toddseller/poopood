class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string    :confirmation_token
      t.boolean   :confirmed,               default: false

      t.string    :email,                   null: false
      t.string    :first_name,              default: ''
      t.string    :last_name,               default: ''

      t.timestamps                          null: false
    end

    add_index :users, :confirmation_token,  unique: true
    add_index :users, :email,               unique: true
  end
end
