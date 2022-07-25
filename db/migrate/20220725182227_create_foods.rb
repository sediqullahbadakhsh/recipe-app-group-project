# frozen_string_literal: true

class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price
      t.string :quantity
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
