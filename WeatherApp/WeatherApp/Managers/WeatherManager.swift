//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Mitya Kim on 4/28/24.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherManager {
    static let shared = WeatherManager()
    
    let service = WeatherService.shared
    
    private init() {}
    
    public func getWeather(for location: CLLocation, completion: @escaping () -> Void) async {
        do {
            let result = try await service.weather(for: location)
            
            print(result.currentWeather)
            print(result.hourlyForecast)
            print(result.dailyForecast)
            
            completion()
        } catch {
            print(String(describing: error))
        }
    }
}

