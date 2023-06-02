# frozen_string_literal: true

module MagsHelper
  NORMAL_MIN = 25
  NORMAL_MAX = 65

  def mad(arr)
    filtered_mag = []
    arr.each { |h| filtered_mag << h if h[:vector_mag] < NORMAL_MIN || h[:vector_mag] > NORMAL_MAX }
    filtered_mag
  end
end
