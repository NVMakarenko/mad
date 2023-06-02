# frozen_string_literal: true

class Mag < ApplicationRecord
  include Math
  require 'csv'

  def self.import(file, file1)
    return I18n.t(:error_add_file) if file.nil?
    return I18n.t(:error_add_file1) if file1.nil?
    return I18n.t(:error_file_extansion) if File.extname(file) != '.csv'
    return I18n.t(:error_file1_extansion) if File.extname(file1) != '.csv'

    return read_files(file,file1)  
  end

  def self.read_files(file,file1)
    header = %i[x_loc y_loc]
    header_magnetometer = %i[x_mag y_mag z_mag]
    i = 0

    location_data = CSV.read(file.path, headers: header)
    CSV.foreach(file1.path, headers: header_magnetometer) do |row|
      mag_dot = location_data[i].to_hash.merge(form_mag_data(row))
      return I18n.t(:error_data) if mag_dot.has_key?(nil) || mag_dot.value?(nil)
      Mag.create! mag_dot
      i += 1
    end
  end

  def self.form_mag_data(row)
    mag_data = row.to_hash
    vector_sum = { vector_mag: Math.sqrt(mag_data[:x_mag].to_f**2 + mag_data[:y_mag].to_f**2 + mag_data[:z_mag].to_f**2).round(4).to_s }

    mag_data.merge(vector_sum)
  end
end
