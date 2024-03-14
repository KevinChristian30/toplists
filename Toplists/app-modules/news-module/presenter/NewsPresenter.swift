//
//  NewsPresenter.swift
//  Toplists
//
//  Created by Nostra on 3/14/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

class NewsPresenter: NewsViewToPresenterProtocol {
    var view: NewsPresenterToViewProtocol?
    
    var interactor: NewsPresenterToInteractorProtocol?
    
    func startFetchingNews(_ coinName: String) {
        interactor?.fetchNews(coinName)
    }
}

extension NewsPresenter: NewsInteractorToPresenterProtocol {
    func newsFetchedSuccess(news: NewsResponseEntity) {
        view?.showNews(news: news)
    }
    
    func newsFetchFailed() {
        view?.showError()
    }
}
