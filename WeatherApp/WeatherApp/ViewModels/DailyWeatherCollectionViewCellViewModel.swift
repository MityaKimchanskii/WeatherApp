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
    
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        return formatter
    }()
   
    
    public var iconName: String {
        return model.symbolName
    }
    
    public var temperature: String {
        return "\(Int(model.lowTemperature.converted(to: .fahrenheit).value))°F - \(Int(model.highTemperature.converted(to: .fahrenheit).value))°F"
    }
    
    public var date: String {
        let day = Calendar.current.component(.weekday, from: model.date)
        return string(from: day)
    }
    
    private func string(from day: Int) -> String {
        switch day {
        case 1: return "Sunday"
        case 2: return "Monday"
        case 3: return "Tuesday"
        case 4: return "Wednesday"
        case 5: return "Thursday"
        case 6: return "Friday"
        case 7: return "Saturday"
        default: return "-"
        }
    }
}
