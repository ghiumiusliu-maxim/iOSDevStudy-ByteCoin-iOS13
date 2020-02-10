//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://api-realtime.exrates.coinapi.io/v1/exchangerate/BTC"
    //let apiKey = "c116dec0-2a1f-43fa-8278-3df2a5e846f6"
    let apiKey = "f1498b3a-22e8-4fea-ae3c-2051b4c6aa79"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        if let url =
            URL(string: "\(baseURL)/\(currency)?apikey=\(apiKey)") {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: handle (data: response: error:))
            task.resume()
        }
    }
    
    func handle (data: Data?, response: URLResponse?, error: Error?) {
        if let safeError = error {
            print(safeError)
            return
        }
        
        if let safeData = data {
            let dataString = String (data: safeData, encoding: .utf8)
            print(dataString ?? "No data")
        }
    }
}
