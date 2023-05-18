# frozen_string_literal: true

class CreateMags < ActiveRecord::Migration[7.0]
  def change
    create_table :mags do |t|
      t.float :x
      t.float :y
      t.float :z

      t.timestamps
    end
  end
end
