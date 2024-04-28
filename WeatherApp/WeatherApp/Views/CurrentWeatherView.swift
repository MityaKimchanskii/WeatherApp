//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Mitya Kim on 4/28/24.
//

import UIKit


class CurrentWeatherView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CurrentWeatherView {
    
    private func style() {
        
    }
    
    private func layout() {
        
    }
}
