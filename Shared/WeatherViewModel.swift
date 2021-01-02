//
//  WeatherViewModel.swift
//  SwiftUI-WeatherApp
//
//  Created by Wiljay Flores on 2021-01-02.
//

import Foundation
import Combine

class WeatherViewModel : ObservableObject {
    
    @Published var weather : Weather?
    
    var city : String {
        
        if let city = self.weather?.name {
            return city
        } else {
            return "----"
        }
        
    }
    
    var temperature: String {
        
        if let temp = self.weather?.main?.temp {
            return String(format: "%.0f", temp)
        } else {
            return "--"
        }
        
    }
    
    func updateWeather(weather: Weather) {
        self.weather = weather
    }
    
    
}
