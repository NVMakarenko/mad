# frozen_string_literal: true

class CreateMagnetometers < ActiveRecord::Migration[7.0]
  def change
    create_table :magnetometers do |t|
      t.float :x_mag
      t.float :y_mag
      t.float :z_mag

      t.timestamps
    end
  end
end
