class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :group_id
      t.string :username
      t.boolean :is_creator
      t.string :password_digest

      t.timestamps
    end
  end
end
