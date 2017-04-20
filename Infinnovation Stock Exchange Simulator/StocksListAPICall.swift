//
//  StocksListAPICall.swift
//  Infinnovation Stock Exchange Simulator
//
//  Created by SwG Ghosh on 16/04/17.
//  Copyright © 2017 infinnovation. All rights reserved.
//

import Foundation

class StocksListAPICall: APICall {
    
    override init(urlString: String, apiKey: String) {
        super.init(urlString: urlString, apiKey: apiKey)
    }
    
    var stocks: [StockItem]?

    func getStocksList() -> [StockItem] {
        stocks = [StockItem]()
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions()) as? [String: Any]
            let list = json!["result"] as! [[String: Any]]
            time = json!["time"] as? String
            
            for item in list {
                let name = item["name"] as! String
                let sector = item["sector"] as! String
                let current = item["current"] as! Int
                let difference = item["difference"] as! Int
                let percentage = item["percentage"] as! Double
                
                let stock: StockItem = StockItem(name: name, current: current, difference: difference, percentage: percentage, sector: sector)
                stocks!.append(stock)
            }
        }
        catch {
            print(error)
        }
        return stocks!
    }
}
