# frozen_string_literal: true

module Waqi
  class WeatherCondition
    attr_reader :carbon_monoxyde, :dew, :relative_humidity, :nitrogen_dioxide,
                :ozone, :atmospheric_pressure, :pm10, :pm25, :sulphur_dioxide,
                :temperature, :wind

    def initialize(data)
      @carbon_monoxyde      = data.dig(:co, :v)
      @dew                  = data.dig(:d, :v)
      @relative_humidity    = data.dig(:h, :v)
      @nitrogen_dioxide     = data.dig(:no2, :v)
      @ozone                = data.dig(:o3, :v)
      @atmospheric_pressure = data.dig(:p, :v)
      @pm10                 = data.dig(:pm10, :v)
      @pm25                 = data.dig(:pm25, :v)
      @sulphur_dioxide      = data.dig(:so2, :v)
      @temperature          = data.dig(:t, :v)
      @wind                 = data.dig(:w, :v)
      # @wind_direction      = data.dig(:wd, :v) # unkown value?
    end
  end
end
