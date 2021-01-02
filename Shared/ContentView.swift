//
//  ContentView.swift
//  Shared
//
//  Created by Wiljay Flores on 2021-01-02.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM : WeatherViewModel
    let request = RequestManager()
    
    init() {
        self.weatherVM = WeatherViewModel()
        request.updateWeather(city: "toronto", model: weatherVM)
    }
    
    var body: some View {
        VStack {
            Text("\(weatherVM.city)")
            Text("\(weatherVM.temperature)")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
