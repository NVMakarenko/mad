# frozen_string_literal: true

class MagsController < ApplicationController
  def index
    @mags = Mag.all
  end

  def import
    Mag.import(params[:file], params[:file1])
    redirect_to root_url, notice: 'Data imported.'
  end
end
