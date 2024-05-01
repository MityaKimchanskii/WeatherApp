//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Mitya Kim on 5/1/24.
//

import Foundation


enum WeatherViewModel {
    case current(viewModel: CurrentWeatherCollectionViewCellViewModel)
    case hourly(viewModel: [HourlyWeatherCollectionViewCellViewModel])
    case daily(viewModel: [DailyWeatherCollectionViewCellViewModel])
}
