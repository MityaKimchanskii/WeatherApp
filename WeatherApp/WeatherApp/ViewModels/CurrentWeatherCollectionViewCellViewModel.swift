//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  WeatherApp
//
//  Created by Mitya Kim on 5/1/24.
//

import Foundation
import WeatherKit


struct CurrentWeatherCollectionViewCellViewModel {
    
    private let model: CurrentWeather
    
    init(model: CurrentWeather) {
        self.model = model
    }
    
    public var condition: String {
        return model.condition.description
    }
    
    public var temperature: String {
        return "\(Int(model.temperature.converted(to: .fahrenheit).value))°F"
    }
    
    public var image: String {
        return model.symbolName
    }
}
