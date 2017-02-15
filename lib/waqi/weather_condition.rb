module Waqi
  class WeatherCondition
    attr_reader :carbon_monoxyde, :dew, :relative_humidity, :nitrogen_dioxide,
                :ozone, :atmospheric_pressure, :pm10, :pm25, :sulphur_dioxide,
                :temperature, :wind

    def initialize(data)
      @carbon_monoxyde      = data[:co][:v]
      @dew                  = data[:d][:v]
      @relative_humidity    = data[:h][:v]
      @nitrogen_dioxide     = data[:no2][:v]
      @ozone                = data[:o3][:v]
      @atmospheric_pressure = data[:p][:v]
      @pm10                 = data[:pm10][:v]
      @pm25                 = data[:pm25][:v]
      @sulphur_dioxide      = data[:so2][:v]
      @temperature          = data[:t][:v]
      @wind                 = data[:w][:v]
      # @wind_direction      = data[:wd][:v] # unkown value?
    end
  end
end
