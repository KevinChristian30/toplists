//
//  CryptoRouter.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import UIKit

class CryptoRouter: CryptoPresenterToRouterProtocol {
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    static func createModule() -> CryptoViewController {
        let view = mainStoryboard.instantiateInitialViewController() as! CryptoViewController
        
        let presenter: CryptoViewToPresenterProtocol & CryptoInteractorToPresenterProtocol = CryptoPresenter()
        let interactor: CryptoPresenterToInteractorProtocol = CryptoInteractor()
        let router: CryptoPresenterToRouterProtocol = CryptoRouter()
    
        view.presenter = presenter
        presenter.view = view as? CryptoPresenterToViewProtocol
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToNewsScreen(navigationController: UINavigationController) {
        print("Navigate to news detail page")
    }
}
