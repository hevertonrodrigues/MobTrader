//
//  ViewController.swift
//  MobTrader
//
//  Created by Heverton Rodrigues on 22/03/18.
//  Copyright © 2018 Slideworks. All rights reserved.
//

import UIKit
import ChameleonFramework

class TickersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
    }
    
    
    
    @IBAction func didClickOpenMenuButton(_ sender: Any) {
        Util.sharedInstance.drawerController.toggle(.left, animated: true) { ( success ) in
        }
    }
}



//Tableview
extension TickersVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell :TickersTVC = tableView.dequeueReusableCell(withIdentifier:  "TickersTableViewCellIdentifier")! as! TickersTVC
        defaultCell.configure()
        return defaultCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "ShowTickerDetailIdentifier", sender: nil)
        
    }
    
}

