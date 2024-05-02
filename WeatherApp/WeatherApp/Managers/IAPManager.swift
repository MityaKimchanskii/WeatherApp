//
//  IAPManager.swift
//  WeatherApp
//
//  Created by Mitya Kim on 4/28/24.
//

import RevenueCat
import Foundation


final class IAPManager {
    static let shared = IAPManager()
    
    private init () {}
    
    func isSubscribed(completion: @escaping (Bool) -> Void) {
        Purchases.shared.getCustomerInfo { info, error in
            guard let subscriptions = info?.activeSubscriptions else { return }
            completion(!subscriptions.isEmpty)
        }
    }
}
