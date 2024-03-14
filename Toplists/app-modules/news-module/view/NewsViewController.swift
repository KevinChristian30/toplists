//
//  NewsViewController.swift
//  Toplists
//
//  Created by Nostra on 3/14/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit

class NewsViewController: UIViewController {
    var presenter: NewsViewToPresenterProtocol?
    var safeArea: UILayoutGuide!
    var newsResponseEntity: NewsResponseEntity?
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    var coinName: String?
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.register(NewsTableCell.self, forCellReuseIdentifier: NewsTableCell.identifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchNews()
    }
    
    func setupUI() {
        safeArea = view.layoutMarginsGuide
        setupTopbar()
        setupActivityIndicator()
        setupTableView()
    }
    
    func setupTopbar() {
        self.navigationItem.title = "News"
    }
    
    func setupActivityIndicator() {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    func setupTableView() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
    
    func fetchNews() {
        showLoadingIndicator()
        presenter?.startFetchingNews(coinName ?? "")
    }
    
    @objc func refresh() {
        fetchNews()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsResponseEntity?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableCell.identifier) as! NewsTableCell
        
        if let news = newsResponseEntity?.data[indexPath.row] {
            cell.bind(news: news)
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NewsViewController: NewsPresenterToViewProtocol {
    func showNews(news: NewsResponseEntity) {
        self.newsResponseEntity = news
        DispatchQueue.main.async {
              self.tableView.reloadData()
              self.hideLoadingIndicator()
              self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    func showError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "Something went wrong, please try again.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
                _ in alert.dismiss(animated: true, completion: nil)
            }))
        }
    }
}
