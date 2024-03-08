//
//  ViewController.swift
//  Toplists
//
//  Created by Nostra on 3/8/24.
//  Copyright © 2024 Nostratech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: BASE_URL + "/data/top/totaltoptiervolfull?limit=10&tsym=USD")
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(CryptoResponseEntity.self, from: data)
                    print(jsonData)
                    print(jsonData.metaData.count)
                } catch {
                    print(error)
                }

            }
        }
        task.resume()
    }

}

