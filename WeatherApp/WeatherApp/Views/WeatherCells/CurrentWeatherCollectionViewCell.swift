//
//  CurrentWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Mitya Kim on 5/1/24.
//

import UIKit


class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
