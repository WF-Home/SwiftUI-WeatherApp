//
//  Weather.swift
//  SwiftUI-WeatherApp
//
//  Created by Wiljay Flores on 2021-01-02.
//

import Foundation

struct Weather : Decodable {
    let main : Main?
    let weather : [WeatherData]?
    let name : String?
}

struct Main : Decodable {
    let temp : Float?
    let feels_like : Float?
    let temp_min : Float?
    let temp_max : Float?
    let humidity : Int?
}

struct WeatherData : Decodable {
    let id : Int?
    let main : String?
    let description : String?
}
