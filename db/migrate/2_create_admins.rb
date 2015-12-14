class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|

      t.string :name
      t.string :password
      t.integer :status

      t.references :hosting, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
