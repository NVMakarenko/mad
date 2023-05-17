# frozen_string_literal: true

class Magnetometer < ApplicationRecord
  include Math
  require 'csv'

  def self.import(file)
    ActiveRecord::Base.connection.tables.each do |t|
      conn = ActiveRecord::Base.connection
      conn.execute("TRUNCATE TABLE #{t} CASCADE;")
      conn.reset_pk_sequence!(t)
    end
    header = %i[x_mag y_mag z_mag vector_mag]
    CSV.foreach(file.path, headers: header) do |row|
      mag_data = row.to_hash
      option = Math.sqrt(mag_data[:x_mag].to_f**2 + mag_data[:y_mag].to_f**2 + mag_data[:z_mag].to_f**2).round(4).to_s
      vector = { vector_mag: option }
      Magnetometer.create! mag_data.merge(vector)
    end
  end

  def truncate!
    connection.execute(
      "TRUNCATE TABLE #{table_name};"
    )
    connection.reset_pk_sequence!(table_name)
  end
end
