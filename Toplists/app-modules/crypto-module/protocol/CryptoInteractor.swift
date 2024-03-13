//
//  CryptoInteractor.swift
//  Toplists
//
//  Created by Nostra on 3/13/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import Foundation

class CryptoInteractor: CryptoPresenterToInteractorProtocol {
    var presenter: CryptoInteractorToPresenterProtocol?
    
    func fetchCryptos() {
        let url: URL? = URL(string: BASE_URL + "/data/top/totaltoptiervolfull?limit=50&tsym=USD")
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(CryptoResponseEntity.self, from: data)
                    self.presenter?.cryptoFetchedSucess(cryptos: jsonData)
                } catch {
                    self.presenter?.cryptoFetchFailed()
                }
            } else {
                self.presenter?.cryptoFetchFailed()
            }
        }
        task.resume()
    }
}
