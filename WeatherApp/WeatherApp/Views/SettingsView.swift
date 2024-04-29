//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Mitya Kim on 4/28/24.
//

import UIKit


final class SettingsView: UIView {
    
    private var viewModel: SettingsViewViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsView {
    private func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    private func layout() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    public func configure(with viewModel: SettingsViewViewModel) {
        self.viewModel = viewModel
    }
}

extension SettingsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.option.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let viewModel {
            cell.textLabel?.text = viewModel.option[indexPath.row].title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
