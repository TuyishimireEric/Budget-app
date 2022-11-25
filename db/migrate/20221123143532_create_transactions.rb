# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :amount
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
