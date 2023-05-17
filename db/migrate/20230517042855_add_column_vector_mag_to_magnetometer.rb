# frozen_string_literal: true

class AddColumnVectorMagToMagnetometer < ActiveRecord::Migration[7.0]
  def change
    add_column :magnetometers, :vector_mag, :float
  end
end
