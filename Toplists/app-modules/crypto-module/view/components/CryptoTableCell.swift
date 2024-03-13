//
//  CryptoTableCell.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit

class CryptoTableCell: UITableViewCell {
    static let identifier = "CryptoTableCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(self.nameLabel)
        stackView.addSubview(self.fullNameLabel)
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func bind(cryptoData: CryptoDataEntity) {
        nameLabel.text = cryptoData.coinInfo.name
        fullNameLabel.text = cryptoData.coinInfo.fullName
        priceLabel.text = cryptoData.display.usd.price
    }
    
    func setupUI() {
        contentView.addSubview(leftStackView)
        NSLayoutConstraint.activate([
            leftStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            leftStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            leftStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 8),
            leftStackView.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.topAnchor.constraint(equalTo: leftStackView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leftStackView.leadingAnchor),
            fullNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            fullNameLabel.leadingAnchor.constraint(equalTo: leftStackView.leadingAnchor),
        ])
    }
}
