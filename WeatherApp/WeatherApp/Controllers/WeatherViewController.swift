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
            print(String(describing: location))
            
            WeatherManager.shared.getWeather(for: location) { [weak self] in

                DispatchQueue.main.async {
                    self?.primaryView.reload()
                }
            }
        }
    }
}

