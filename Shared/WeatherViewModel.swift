//
//  WeatherViewModel.swift
//  SwiftUI-WeatherApp
//
//  Created by Wiljay Flores on 2021-01-02.
//

import Foundation
import Combine

enum temp_type {
    case fahrenheit
    case celcius
}

class WeatherViewModel : ObservableObject {
    
    @Published var weather : Weather?
    
    var city : String {
        if let city = self.weather?.name {
            return city
        } else {
            return "----"
        }
    }
    
    var temperatureInCelcius: String {
        if let temp = self.weather?.main?.temp {
            return String(format: "%.0f", convertTemperature(temp_type: .celcius, temp: temp))
        } else {
            return "--"
        }
    }
    
    var temperatureInFahrenheit: String {
        if let temp = self.weather?.main?.temp {
            return String(format: "%.0f", convertTemperature(temp_type: .fahrenheit, temp: temp))
        } else {
            return "--"
        }
    }
    
    func updateWeather(weather: Weather) {
        self.weather = weather
    }
    
    private func convertTemperature(temp_type: temp_type, temp: Float) -> Float {
        switch temp_type {
            case .fahrenheit:
                return ((temp - 273.15) * 9/5 + 32)
            case .celcius:
                return (temp - 273.15)
        }
    }
    
    
}
