//
//  TickerTradeTVC
//  MobTrader
//
//  Created by Heverton Rodrigues on 22/03/18.
//  Copyright © 2018 Slideworks. All rights reserved.
//

import UIKit
import ChameleonFramework

class TickerTradeTVC: UITableViewCell {
    
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblVolume: UILabel!
    
    @IBOutlet weak var viewMiniChart: UIView!
    
    func configure( green :Bool )
    {
        if green {
            self.lblPrice.textColor = UIColor.flatGreenDark
        } else {
            self.lblPrice.textColor = UIColor.flatRedDark
        }
        
    }
}
