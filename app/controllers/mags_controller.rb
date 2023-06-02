# frozen_string_literal: true

class MagsController < ApplicationController
  def index
    @mags = Mag.all
  end

  def import
    Mag.import(params[:file], params[:file1])
    redirect_to root_url, notice: t(:error_add_file) if Mag.first.nil?
    redirect_to root_url, notice: t(:data_import_notice) unless Mag.first.nil?
  end
end
