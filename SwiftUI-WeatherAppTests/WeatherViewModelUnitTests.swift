//
//  WeatherViewModelUnitTests.swift
//  Tests iOS
//
//  Created by Wiljay Flores on 2021-01-02.
//

import XCTest
@testable import SwiftUI_WeatherApp

class WeatherViewModelUnitTests: XCTestCase {

    let testData = Weather(main: Main(temp: 13.00, feels_like: 13.00, temp_min: 13.00, temp_max: 13.00, humidity: 13),
                           weather: [WeatherData(id: 13, main: "rainy", description: "light rain")],
                           name: "toronto"
    )
    
    let modelToTest = WeatherViewModel()
    
    override func setUpWithError() throws {
        
        modelToTest.weather = testData

        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        modelToTest.weather = nil
    }

    func testCityName() throws {
        XCTAssertEqual(modelToTest.city, "toronto")
    }
    
    func testTemperature() throws {
        XCTAssertEqual(modelToTest.temperature, String(format: "%.0f", 13.00))
    }
    
    func testCityNameWhenNil() throws {
        modelToTest.weather = nil
        XCTAssertEqual(modelToTest.city, "----")
        
    }
    
    func testTemperatureWhenNil() throws {
        modelToTest.weather = nil
        XCTAssertEqual(modelToTest.temperature, "--")
    }

}
