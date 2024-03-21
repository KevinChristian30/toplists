//
//  CryptoViewController.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

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
        view.register(CryptoTableCell.self, forCellReuseIdentifier: CryptoTableCell.identifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCryptos()
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
        cryptoTableView.refreshControl = UIRefreshControl()
        cryptoTableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        view.addSubview(cryptoTableView)
        cryptoTableView.snp.makeConstraints {
            make in
            make.top.equalTo(self.safeArea.snp.top)
            make.trailing.equalTo(self.view.snp.trailing)
            make.leading.equalTo(self.view.snp.leading)
            make.bottom.equalTo(self.view.snp.bottom)
        }
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
    
    func fetchCryptos() {
        showLoadingIndicator()
        presenter?.startFetchingCryptos()
    }
    
    @objc func refresh() {
        fetchCryptos()
    }
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoResponseEntity?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cryptoTableView.dequeueReusableCell(withIdentifier: CryptoTableCell.identifier) as! CryptoTableCell
        
        if let cryptoData = cryptoResponseEntity?.data[indexPath.row] {
            cell.bind(cryptoData: cryptoData)
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showNewsController(navigationController: self.navigationController!, coinName: cryptoResponseEntity?.data[indexPath.row].coinInfo.name ?? "")
    }
}

extension CryptoViewController: CryptoPresenterToViewProtocol {
    func showCryptos(cryptos: CryptoResponseEntity) {
        self.cryptoResponseEntity = cryptos
        DispatchQueue.main.async {
            self.cryptoTableView.reloadData()
            self.hideLoadingIndicator()
            self.cryptoTableView.refreshControl?.endRefreshing()
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong, please pull to try again.", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
            _ in alert.dismiss(animated: true, completion: nil)
        }))
    }
}
