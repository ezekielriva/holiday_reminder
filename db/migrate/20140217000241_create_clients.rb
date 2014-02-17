class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string        :name
      t.string        :email
      t.belongs_to    :user
      t.timestamps
    end

    add_index :clients, :email, unique:true
    add_index :clients, :user_id
  end
end
