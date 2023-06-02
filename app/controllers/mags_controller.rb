# frozen_string_literal: true

class MagsController < ApplicationController
  def index
    @mags = Mag.all
  end

  def import
    reset_db
    result = Mag.import(params[:file], params[:file1])
    redirect_to root_url, notice: result if Mag.first.nil?
    redirect_to root_url, notice: t(:data_import_notice) unless Mag.first.nil?
  end

  private

  def reset_db
    conn = ActiveRecord::Base.connection
    tables = ActiveRecord::Base.connection.tables
    tables.each { |t| conn.execute("TRUNCATE #{t}") }

    Rails.application.load_seed
  end
end
