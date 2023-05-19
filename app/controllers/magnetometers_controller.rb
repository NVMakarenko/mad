# frozen_string_literal: true

class MagnetometersController < ApplicationController
  def index
    @magnetometers = Magnetometer.all
    @chart_xyz = `python lib/assets/python/chart_xyz.py @magnetometers`
  end

  def import
    Magnetometer.import(params[:file])
    redirect_to '/magnetometers/index.html', allow_other_host: true, notice: 'Magnetometer data imported.'
  end
end
