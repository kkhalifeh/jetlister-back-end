class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password

    add_column    :users, :email, :string, index: { unique: true }, null: false
    add_column    :users, :crypted_password, :string
    add_column    :users, :salt, :string
  end
end
