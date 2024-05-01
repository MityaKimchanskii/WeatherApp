//
//  HourlyWeatherCollectionViewCellViewModel.swift
//  WeatherApp
//
//  Created by Mitya Kim on 5/1/24.
//

import Foundation
import WeatherKit

struct HourlyWeatherCollectionViewCellViewModel {
    
    private let model: HourWeather
    
    init(model: HourWeather) {
        self.model = model
    }
}
