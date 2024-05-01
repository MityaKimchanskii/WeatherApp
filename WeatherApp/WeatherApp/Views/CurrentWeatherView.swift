//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Mitya Kim on 4/28/24.
//

import UIKit


class CurrentWeatherView: UIView {
    
    private var collectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createCollectionView()
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
        guard let collectionView else { return }
        
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    public func reload() {
        
    }
    
    private func createCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.layout(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(CurrentWeatherCollectionViewCell.self, forCellWithReuseIdentifier: CurrentWeatherCollectionViewCell.cellIdentifier)
        collectionView.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.cellIdentifier)
        collectionView.register(DailyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: DailyWeatherCollectionViewCell.cellIdentifier)
        
        
        
        self.collectionView = collectionView
    }
    
    private func layout(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let section = CurrentWeatherSection.allCases[sectionIndex]
        
        switch section {
        case .current:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.75)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.75)), subitems: [item])
            return NSCollectionLayoutSection(group: group)
        case .hourly:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.75)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.75)), subitems: [item])
            return NSCollectionLayoutSection(group: group)
        case .daily:
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.75)))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.75)), subitems: [item])
            return NSCollectionLayoutSection(group: group)
        }
    }
}


extension CurrentWeatherView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentWeatherCollectionViewCell.cellIdentifier, for: indexPath) as? CurrentWeatherCollectionViewCell else { fatalError() }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherCollectionViewCell.cellIdentifier, for: indexPath) as? HourlyWeatherCollectionViewCell else { fatalError() }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyWeatherCollectionViewCell.cellIdentifier, for: indexPath) as? DailyWeatherCollectionViewCell else { fatalError() }
            return cell
        }
    }
}
