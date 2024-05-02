//
//  CurrentWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Mitya Kim on 5/1/24.
//

import UIKit


class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CurrentWeatherCollectionViewCell"
    
    private let tempLabel = UILabel()
    private let conditionLabel = UILabel()
    private let iconImageView = UIImageView()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        tempLabel.text = nil
        iconImageView.image = nil
        conditionLabel.text = nil
    }
}

extension CurrentWeatherCollectionViewCell {
    private func style() {
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.textAlignment = .center
        tempLabel.font = .systemFont(ofSize: 42, weight: .bold)
        
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.textAlignment = .center
        conditionLabel.font = .systemFont(ofSize: 32, weight: .medium)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
       
        
    }
    
    private func layout() {
        contentView.addSubview(tempLabel)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(conditionLabel)
        
        NSLayoutConstraint.activate([
            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tempLabel.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            iconImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    public func configure(with viewModel: CurrentWeatherCollectionViewCellViewModel) {
        tempLabel.text = viewModel.temperature
        iconImageView.image = UIImage(systemName: viewModel.image)
        conditionLabel.text = viewModel.condition
    }
}
