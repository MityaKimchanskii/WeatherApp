//
//  HourlyWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Mitya Kim on 5/1/24.
//

import UIKit


class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "HourlyWeatherCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: HourlyWeatherCollectionViewCellViewModel) {
        
    }
}
