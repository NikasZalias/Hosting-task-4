class CreateHostings < ActiveRecord::Migration
  def change
    create_table :hostings do |t|
      t.string :title
      t.integer :current_money_count
      t.string :account_number
      t.timestamps null: false
    end
  end
end
