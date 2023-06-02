# frozen_string_literal: true

class Mag < ApplicationRecord
  include Math
  require 'csv'

  def self.import(file, file1)
    ActiveRecord::Base.connection.tables.each do |t|
      conn = ActiveRecord::Base.connection
      conn.execute("TRUNCATE TABLE #{t} CASCADE;")
      conn.reset_pk_sequence!(t)
    end
    header = %i[x_loc y_loc]
    header_magnetometer = %i[x_mag y_mag z_mag]

    i = 0
    return if file.nil? || file1.nil?
      location_data = CSV.read(file.path, headers: header)
      CSV.foreach(file1.path, headers: header_magnetometer) do |row|
        mag_dot = location_data[i].to_hash.merge(form_mag_data(row))

        Mag.create! mag_dot
        i += 1
      end
  end

  def truncate!
    connection.execute(
      "TRUNCATE TABLE #{table_name};"
    )
    connection.reset_pk_sequence!(table_name)
  end

  def self.form_mag_data(row)
    mag_data = row.to_hash
    vector_sum = { vector_mag: Math.sqrt(mag_data[:x_mag].to_f**2 + mag_data[:y_mag].to_f**2 + mag_data[:z_mag].to_f**2).round(4).to_s }

    mag_data.merge(vector_sum)
  end
end
