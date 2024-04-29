//
//  SettingsViewViewModel.swift
//  WeatherApp
//
//  Created by Mitya Kim on 4/28/24.
//

import Foundation


struct SettingsViewViewModel {
    let option: [SettingOption]
}

enum SettingOption: CaseIterable {
    case upgrade
    case privacyPolicy
    case terms
    case contact
    case getHelp
    case rateApp
    
    var title: String {
        switch self {
        case .upgrade:
            "Upgrade to Pro"
        case .privacyPolicy:
            "Privacy Policy"
        case .terms:
            "Terms of use"
        case .getHelp:
            "Get Help"
        case .rateApp:
            "Rate App"
        case .contact:
            "Contact Us"
        }
    }
}
