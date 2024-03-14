//
//  NewsInteractor.swift
//  Toplists
//
//  Created by Nostra on 3/14/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

class NewsInteractor: NewsPresenterToInteractorProtocol {
    var presenter: NewsInteractorToPresenterProtocol?
    
    func fetchNews(_ coinName: String) {
        let url: URL? = URL(string: BASE_URL + "/data/v2/news/?lang=EN&categories=\(coinName)")
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(NewsResponseEntity.self, from: data)
                    self.presenter?.newsFetchedSuccess(news: jsonData)
                } catch {
                    self.presenter?.newsFetchFailed()
                }
            } else {
                self.presenter?.newsFetchFailed()
            }
        }
        task.resume()
    }
}
