# frozen_string_literal: true

class Location < ApplicationRecord
  require 'csv'

  def self.import(file)
    ActiveRecord::Base.connection.tables.each do |t|
      conn = ActiveRecord::Base.connection
      conn.execute("TRUNCATE TABLE #{t} CASCADE;")
      conn.reset_pk_sequence!(t)
    end
    header = %i[x_loc y_loc]
    CSV.foreach(file.path, headers: header) do |row|
      Location.create! row.to_hash
    end
  end

  def truncate!
    connection.execute(
      "TRUNCATE TABLE #{table_name};"
    )
    connection.reset_pk_sequence!(table_name)
  end
end
