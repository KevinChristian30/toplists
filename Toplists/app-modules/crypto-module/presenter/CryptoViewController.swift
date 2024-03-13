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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.startFetchingCryptos()
        view.backgroundColor = .red
    }
}
