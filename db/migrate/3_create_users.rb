class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.integer :number
      t.string :account_number

      t.string :password
      t.boolean :blocked
      t.integer :status
      t.string :domains_name

      t.string :email
      t.string :person_type
      t.string :company_name
      t.string :country
      t.integer :current_money_count

      t.integer :domain_count
      t.string :server

      t.references :admin, index: true, foreign_key: true, null: true
      t.references :hosting, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end
