class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.integer :price

      t.references :hosting, index: true, foreign_key: true, null: true
      t.references :admin, index: true, foreign_key: true, null: true
      t.references :user, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end
