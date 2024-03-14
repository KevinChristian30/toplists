//
//  CryptoProtocol.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit

protocol CryptoInteractorToPresenterProtocol: class {
    func cryptoFetchedSucess(cryptos: CryptoResponseEntity)
    func cryptoFetchFailed()
}

protocol CryptoPresenterToInteractorProtocol: class {
    var presenter: CryptoInteractorToPresenterProtocol? { get set }
    func fetchCryptos()
}

protocol CryptoPresenterToViewProtocol: class {
    func showCryptos(cryptos: CryptoResponseEntity)
    func showError()
}

protocol CryptoPresenterToRouterProtocol: class {
    static func createModule() -> CryptoViewController
    func pushToNewsScreen(navigationController: UINavigationController, coinName: String)
}

protocol CryptoViewToPresenterProtocol: class {
    var view: CryptoPresenterToViewProtocol? { get set }
    var interactor: CryptoPresenterToInteractorProtocol? { get set }
    var router: CryptoPresenterToRouterProtocol? { get set }
    func startFetchingCryptos()
    func showNewsController(navigationController: UINavigationController, coinName: String)
}
