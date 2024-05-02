//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mitya Kim on 4/28/24.
//

import UIKit
import RevenueCatUI
import RevenueCat
import WeatherKit

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
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "crown"), style: .done, target: self, action: #selector(didTapUpgrade))
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
                    self?.createViewModels(currentWeather: currentWeather)
                }
            }
        }
    }
    
    private func createViewModels(currentWeather: CurrentWeather) {
        var viewModels: [WeatherViewModel] = [
            .current(viewModel: .init(model: currentWeather)),
            .hourly(viewModel: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0 ) })),
        ]
        
        primaryView.configure(with: viewModels)
        
        IAPManager.shared.isSubscribed { [weak self] subscribed in
            DispatchQueue.main.async {
                if subscribed {
                    viewModels.append(.daily(viewModel: WeatherManager.shared.dailyWeather.compactMap({ .init(model: $0 ) })))
                    self?.primaryView.configure(with: viewModels)
                } else {
                    self?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "crown"), style: .done, target: self, action: #selector(self?.didTapUpgrade))
                }
            }
        }
    }
    
    @objc private func didTapUpgrade() {
        let vc = PaywallViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension WeatherViewController: PaywallViewControllerDelegate {
    func paywallViewController(_ controller: PaywallViewController, didFinishPurchasingWith customerInfo: CustomerInfo) {
//        print("Purchased: \(customerInfo)")
        controller.dismiss(animated: true)
        guard let currentWeather = WeatherManager.shared.currentWeather else { return }
        createViewModels(currentWeather: currentWeather)
    }
    
    func paywallViewController(_ controller: PaywallViewController, didFinishRestoringWith customerInfo: CustomerInfo) {
//        print("Purchased: \(customerInfo)")
        controller.dismiss(animated: true)
    }
}

