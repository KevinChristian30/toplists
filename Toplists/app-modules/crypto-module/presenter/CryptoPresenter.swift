//
//  CryptoPresenter.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit

class CryptoPresenter: CryptoViewToPresenterProtocol {
    var view: CryptoPresenterToViewProtocol?
    
    var interactor: CryptoPresenterToInteractorProtocol?
    
    var router: CryptoPresenterToRouterProtocol?
    
    func startFetchingCryptos() {
        interactor?.fetchCryptos()
    }
    
    func showNewsController(navigationController: UINavigationController, coinName: String) {
        router?.pushToNewsScreen(navigationController: navigationController, coinName: coinName)
    }
}

extension CryptoPresenter: CryptoInteractorToPresenterProtocol {
    func cryptoFetchedSucess(cryptos: CryptoResponseEntity) {
        view?.showCryptos(cryptos: cryptos)
    }
    
    func cryptoFetchFailed() {
        view?.showError()
    }
}
