//
//  ViewController.swift
//  MobTrader
//
//  Created by Heverton Rodrigues on 22/03/18.
//  Copyright © 2018 Slideworks. All rights reserved.
//

import UIKit

class MenuVC: UITableViewController  {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 1: //portfolio
            Util.sharedInstance.openController(vc: UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController())
        case 2: //tickers
            Util.sharedInstance.openController(vc: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TickersNavigationIdentifier"))
        case 3: //orders
            Util.sharedInstance.openController(vc: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyOrdersNavigationIdentifier"))
        case 4: //trading
            print("trading")
        case 5: //alerts
            print("alerts")
        case 6: //exit
            print("exit")
        default:
            break
        }
    }
}
