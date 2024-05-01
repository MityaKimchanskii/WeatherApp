//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Mitya Kim on 4/28/24.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let primaryView: SettingsView = {
        let view = SettingsView()
        let viewModel = SettingsViewViewModel(option: SettingOption.allCases)
        view.configure(with: viewModel)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        style()
        layout()
    }
}

extension SettingsViewController {
    private func style() {
        primaryView.delegate = self
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
}

extension SettingsViewController: SettingsViewDelegate {
    func settingsView(_ settingsView: SettingsView, didTap option: SettingOption) {
        print("Hello")
        switch option {
        case .upgrade:
            break
        case .privacyPolicy:
            break
        case .terms:
            break
        case .contact:
            break
        case .getHelp:
            break
        case .rateApp:
            break
        }
    }
}
