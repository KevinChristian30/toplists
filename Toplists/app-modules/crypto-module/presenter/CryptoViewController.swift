//
//  CryptoViewController.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit

class CryptoViewController: UIViewController {
    var presenter: CryptoViewToPresenterProtocol?
    var safeArea: UILayoutGuide!
    var cryptoResponseEntity: CryptoResponseEntity?
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    private lazy var cryptoTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(CryptoTableCell.self, forCellReuseIdentifier: "CryptoTableCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showLoadingIndicator()
        presenter?.startFetchingCryptos()
        
    }
    
    func setupUI() {
        safeArea = view.layoutMarginsGuide
        setupTopbar()
        setupActivityIndicator()
        setupTableView()
    }
    
    func setupTopbar() {
        self.navigationItem.title = "Toplists"
    }
    
    func setupActivityIndicator() {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    func setupTableView() {
        view.addSubview(cryptoTableView)
        NSLayoutConstraint.activate([
            cryptoTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            cryptoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cryptoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -16),
            cryptoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.activityIndicator)
            self.activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
        }
    }
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoResponseEntity?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cryptoTableView.dequeueReusableCell(withIdentifier: "CryptoTableCell") as! CryptoTableCell
        
        if let cryptoData = cryptoResponseEntity?.data[indexPath.row] {
            cell.bind(cryptoData: cryptoData)
        }
        
        return cell;
    }
}

extension CryptoViewController: CryptoPresenterToViewProtocol {
    func showCryptos(cryptos: CryptoResponseEntity) {
        self.cryptoResponseEntity = cryptos
        DispatchQueue.main.async {
            self.cryptoTableView.reloadData()
            self.hideLoadingIndicator()
        }
    }
    
    func showError() {
        
    }
}
