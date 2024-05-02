//
//  HourlyWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Mitya Kim on 5/1/24.
//

import UIKit


class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "HourlyWeatherCollectionViewCell"
    
    private let timeLabel = UILabel()
    private let tempLabel = UILabel()
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
        timeLabel.text = nil
    }
}

extension HourlyWeatherCollectionViewCell {
    private func style() {
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textAlignment = .center
        timeLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.textAlignment = .center
        tempLabel.font = .systemFont(ofSize: 18, weight: .medium)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
    }
    
    private func layout() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(tempLabel)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    public func configure(with viewModel: HourlyWeatherCollectionViewCellViewModel) {
        iconImageView.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature.description
        timeLabel.text = viewModel.hour
    }
}
