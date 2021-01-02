//
//  NetworkService.swift
//  SwiftUI-WeatherApp
//
//  Created by Wiljay Flores on 2021-01-02.
//

import Foundation
import Combine

final class NetworkService {
    
    func fetchWeather(city: String) -> AnyPublisher<Weather, Error> {
        
        let components = generateURL(city: city)
        
        return URLSession.shared.dataTaskPublisher(for: components.url!)
            .map {$0.data}
            .decode(type: Weather.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
     private func generateURL(city: String) -> URLComponents {
        
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/weather"
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: "503de26b7f63b2827a5743cb9e55638d" )
        ]
        
        return components
        
    }
    
    
}
