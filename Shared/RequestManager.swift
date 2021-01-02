//
//  RequestManager.swift
//  SwiftUI-WeatherApp
//
//  Created by Wiljay Flores on 2021-01-02.
//

import Combine

class RequestManager {
    
    private let networkService = NetworkService()
    
    var cancellable : AnyCancellable?
    
    func updateWeather(city: String, model: WeatherViewModel) {
        cancellable = networkService.fetchWeather(city: city).sink(receiveCompletion: { _ in
        }, receiveValue: { (weather) in
            
            guard let cityData = weather.name else {
                print("Error: No city information")
                return
            }
            
            guard let weatherData = weather.weather else {
                print("Error: No weather data")
                return
            }
            
            guard let main = weather.main else {
                print("Error: No main data")
                return
            }
            
            model.updateWeather(weather: Weather(main: main, weather: weatherData, name: cityData))
        })
    }
}
