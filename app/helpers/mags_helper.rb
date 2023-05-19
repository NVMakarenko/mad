# frozen_string_literal: true

module MagsHelper
  NORMAL_MIN = 25
  NORMAL_MAX = 65
  
  def mad(arr)
    filtered_mag = Array.new
    arr.each { |h| filtered_mag << h if h[:z]<NORMAL_MIN || h[:z]>NORMAL_MAX}
    return filtered_mag
  end
end
