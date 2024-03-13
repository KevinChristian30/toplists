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
        setupUI();
        presenter?.startFetchingCryptos()
    }
    
    func setupUI() {
        safeArea = view.layoutMarginsGuide
        setupTopbar()
        setupTableView();
    }
    
    func setupTopbar() {
        self.navigationItem.title = "Toplists"
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
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cryptoTableView.dequeueReusableCell(withIdentifier: "CryptoTableCell") as! CryptoTableCell
        cell.bind(name: "Name")
        return cell;
    }
}
