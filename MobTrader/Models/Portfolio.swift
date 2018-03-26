//
//  TickerTradeTVC
//  MobTrader
//
//  Created by Heverton Rodrigues on 22/03/18.
//  Copyright © 2018 Slideworks. All rights reserved.
//

import Foundation


struct Portfolio :Codable {
    let name: String
    let averagePrice: Double
    let change: Double
    let amount: Double
    
    
    
    static func getAll(_ filters: [AnyHashable: String]?,
                onSuccess success: @escaping (_ results: [Portfolio]) -> Void,
                onFailure failure: @escaping (_ error: Error?, _ params: [AnyHashable: String]) -> Void) {

        let jsonString :String = "[{\"name\": \"BTC\",\"averagePrice\": 1,\"change\": 2,\"amount\": 3},{\"name\": \"ETH\",\"averagePrice\": 1,\"change\": 2,\"amount\": 3},{\"name\": \"XRP\",\"averagePrice\": 1,\"change\": 2,\"amount\": 3},{\"name\": \"XLM\",\"averagePrice\": 1,\"change\": 2,\"amount\": 3}]"
        
        if let jsonData = jsonString.data(using: .utf8)
        {
            do {
                let itens = try JSONDecoder().decode([Portfolio].self, from: jsonData)
                success(itens)
            } catch let error {

                failure(error, ["message": "Problemas ao ler objeto"])
            }
        } else {
            failure(nil, ["message": "Problemas ao ler objeto"])
        }
//        if let json = try? JSONDecoder().decode([Portfolio].self, from: jsonDataString.data(using: .utf8)!) { self.itens = json }
   
    }

}
