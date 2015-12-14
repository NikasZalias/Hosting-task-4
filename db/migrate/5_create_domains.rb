class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.integer :price

      t.references :user, index: true, foreign_key: true, null: true
      t.references :admin, index: true, foreign_key: true, null: true
      t.references :server, index: true, foreign_key: true, null: true
      t.references :hosting, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end