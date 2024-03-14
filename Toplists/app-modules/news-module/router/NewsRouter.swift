//
//  MovieRouter.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit

class NewsRouter {
    static func createModule(coinName: String) -> NewsViewController {
        let view = NewsViewController()
        view.coinName = coinName
        
        let presenter: NewsViewToPresenterProtocol & NewsInteractorToPresenterProtocol = NewsPresenter()
        let interactor: NewsPresenterToInteractorProtocol = NewsInteractor()

        view.presenter = presenter
        presenter.view = view as NewsPresenterToViewProtocol
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
