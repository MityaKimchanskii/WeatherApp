//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mitya Kim on 4/28/24.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let primaryView = CurrentWeatherView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        style()
        layout()
        getLocation()
    }
}

extension WeatherViewController {
    private func style() {
        view.backgroundColor = .systemBackground
        primaryView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(primaryView)
        
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            primaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                DispatchQueue.main.async {
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return }
                    self?.primaryView.configure(with: [
                        .current(viewModel: .init(model: currentWeather)),
                        .hourly(viewModel: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0 ) })),
                        .daily(viewModel: WeatherManager.shared.dailyWeather.compactMap({ .init(model: $0 ) }))
                    ])
                }
            }
        }
    }
}

