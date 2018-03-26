//
//  ViewController.swift
//  MobTrader
//
//  Created by Heverton Rodrigues on 22/03/18.
//  Copyright © 2018 Slideworks. All rights reserved.
//

import UIKit

class HomeCurrencyTVC: UITableViewCell {
    
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblChange: UILabel!
    
    
    func configure( item :Portfolio ){
        self.lblCurrency.text = item.name
        self.lblAmount.text = "\(item.amount)"
        self.lblPrice.text = "\(item.averagePrice)"
        self.lblChange.text = "\(item.change)"
    }
    
}
