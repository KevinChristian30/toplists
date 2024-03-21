//
//  CryptoTableCell.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

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
    
    private lazy var tickLabel: Tick = {
        let tick = Tick()
        tick.translatesAutoresizingMaskIntoConstraints = false
        tick.textAlignment = .center
        tick.font = .boldSystemFont(ofSize: 14)
        tick.textColor = .white
        tick.cornerRadius = 8
        return tick
    }()
    
    private lazy var leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.addArrangedSubview(self.nameLabel)
        stackView.addArrangedSubview(self.fullNameLabel)
        
        return stackView
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.addArrangedSubview(self.priceLabel)
        stackView.addArrangedSubview(self.tickLabel)
        
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
        tickLabel.text = String(format: "%.2f(%.2f)", cryptoData.raw.usd.changeHour, cryptoData.raw.usd.changePCTHour)
        tickLabel.backgroundColor = cryptoData.raw.usd.changePCTHour > 0 && cryptoData.raw.usd.changeHour > 0 ? .green : .red
    }
    
    func setupUI() {
        contentView.addSubview(leftStackView)
        contentView.addSubview(rightStackView)
        
        leftStackView.snp.makeConstraints {
            make in
            make.top.equalTo(self.contentView.layoutMarginsGuide.snp.top)
            make.bottom.equalTo(self.contentView.layoutMarginsGuide.snp.bottom)
            make.leading.equalTo(self.contentView.layoutMarginsGuide.snp.leading)
        }
        
        rightStackView.snp.makeConstraints {
            make in
            make.top.equalTo(self.contentView.layoutMarginsGuide.snp.top)
            make.bottom.equalTo(self.contentView.layoutMarginsGuide.snp.bottom)
            make.trailing.equalTo(self.contentView.layoutMarginsGuide.snp.trailing)
        }
    }
}
