//
//  CryptoInteractor.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation
import Alamofire

class CryptoInteractor: CryptoPresenterToInteractorProtocol {
    var presenter: CryptoInteractorToPresenterProtocol?
    
    func fetchCryptos() {
        AF.request(BASE_URL + "/data/top/totaltoptiervolfull?limit=50&tsym=USD").response {
            response in
            if let data = response.data {
                do {
                    let json = try JSONDecoder().decode(CryptoResponseEntity.self, from: data)
                    self.presenter?.cryptoFetchedSucess(cryptos: json)
                } catch {
                    self.presenter?.cryptoFetchFailed()
                }
            } else {
                self.presenter?.cryptoFetchFailed()
            }
        }
    }
}
