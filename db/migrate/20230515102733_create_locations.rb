# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.float :x_loc
      t.float :y_loc

      t.timestamps
    end
  end
end
