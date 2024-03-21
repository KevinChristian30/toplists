//
//  NewsInteractor.swift
//  Toplists
//
//  Created by Nostra on 3/14/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import Alamofire

class NewsInteractor: NewsPresenterToInteractorProtocol {
    var presenter: NewsInteractorToPresenterProtocol?
    
    func fetchNews(_ coinName: String) {
        AF.request(BASE_URL + "/data/v2/news/?lang=EN&categories=\(coinName)").response {
            response in
            if let data = response.data {
                do {
                    let json = try JSONDecoder().decode(NewsResponseEntity.self, from: data)
                    self.presenter?.newsFetchedSuccess(news: json)
                } catch {
                    self.presenter?.newsFetchFailed()
                }
            } else {
                self.presenter?.newsFetchFailed()
            }
        }
    }
}
