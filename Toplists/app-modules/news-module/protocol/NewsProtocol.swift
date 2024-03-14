//
//  NewsProtocol.swift
//  Toplists
//
//  Created by Nostra on 3/14/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit

protocol NewsInteractorToPresenterProtocol: class {
    func newsFetchedSuccess(news: NewsResponseEntity)
    func newsFetchFailed()
}

protocol NewsPresenterToInteractorProtocol: class {
    var presenter: NewsInteractorToPresenterProtocol? { get set }
    func fetchNews(_ coinName: String)
}

protocol NewsPresenterToViewProtocol: class {
    func showNews(news: NewsResponseEntity)
    func showError()
}

protocol NewsViewToPresenterProtocol: class {
    var view: NewsPresenterToViewProtocol? { get set }
    var interactor: NewsPresenterToInteractorProtocol? { get set }
    
    func startFetchingNews(_ coinName: String)
}
