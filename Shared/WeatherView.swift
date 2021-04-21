//
//  WeatherView.swift
//  Shared
//
//  Created by Wiljay Flores on 2021-01-02.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var weatherVM : WeatherViewModel
    let request = RequestManager()
    
    init() {
        self.weatherVM = WeatherViewModel()
        request.updateWeather(city: "toronto", model: weatherVM)
    }
    
    var body: some View {
        VStack {
            Text("\(weatherVM.city)")
            Text("\(weatherVM.temperatureInCelcius)")
        }
    }
    
    
}

#if DEBUG

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

#endif
