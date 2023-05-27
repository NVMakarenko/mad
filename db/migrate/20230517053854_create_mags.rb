# frozen_string_literal: true

class CreateMags < ActiveRecord::Migration[7.0]
  def change
    create_table :mags do |t|
      t.float :x_loc
      t.float :y_loc
      t.float :x_mag
      t.float :y_mag
      t.float :z_mag
      t.float :vector_mag

      t.timestamps
    end
  end
end
