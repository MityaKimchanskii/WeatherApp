//
//  DailyWeatherCollectionViewCellViewModel.swift
//  WeatherApp
//
//  Created by Mitya Kim on 5/1/24.
//

import Foundation
import WeatherKit

struct DailyWeatherCollectionViewCellViewModel {
    private let model: DayWeather
    
    init(model: DayWeather) {
        self.model = model
    }
}
