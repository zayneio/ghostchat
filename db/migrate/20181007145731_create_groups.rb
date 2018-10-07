class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :password_digest
      t.string :slug
      t.datetime :expiration

      t.timestamps
    end
  end
end
