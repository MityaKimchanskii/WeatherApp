//
//  DailyWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Mitya Kim on 5/1/24.
//

import UIKit


class DailyWeatherCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DailyWeatherCollectionViewCell"
    
    private let dayLabel = UILabel()
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
        dayLabel.text = nil
    }
}

extension DailyWeatherCollectionViewCell {
    private func style() {
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textAlignment = .center
        dayLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.textAlignment = .center
        tempLabel.font = .systemFont(ofSize: 18, weight: .regular)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
    }
    
    private func layout() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(tempLabel)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    public func configure(with viewModel: DailyWeatherCollectionViewCellViewModel) {
        iconImageView.image = UIImage(systemName: viewModel.iconName)
        tempLabel.text = viewModel.temperature.description
        dayLabel.text = viewModel.date
    }
}
