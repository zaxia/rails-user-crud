class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :user, id: false do |t|
      t.string :login, null: false, primary_key: true
      t.string :password, null: false
      t.string :firstname
      t.string :lastname

      t.date :createdAt
      t.date :updatedAt
    end
  end
end
