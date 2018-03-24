//
//  ViewController.swift
//  MobTrader
//
//  Created by Heverton Rodrigues on 22/03/18.
//  Copyright © 2018 Slideworks. All rights reserved.
//

import UIKit
import ChameleonFramework
import BetterSegmentedControl
import ActionSheetPicker_3_0

class MyOrdersVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: BetterSegmentedControl!
    @IBOutlet weak var tfPair: UITextField!
    
    override func viewDidLoad() {
        self.segmentedControl.titles = ["Future", "Active", "History"]
        try? self.segmentedControl.setIndex(1)
        self.segmentedControl.addTarget(self, action: #selector(self.changeOrdersType(_:)), for: .valueChanged)
    }
    
    
    @IBAction func changeOrdersType(_ sender: BetterSegmentedControl) {
        print("The selected index is \(sender.index) and the title is \(sender.titles[Int(sender.index)])")
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.tfPair {
            
            ActionSheetMultipleStringPicker.show(withTitle: "Select your pair", rows: [
                ["USDT", "BTC", "ETH"],
                ["XLM", "ADA", "XRP", "XMR", "ETH", "BTC"]
                ], initialSelection: [0, 5], doneBlock: {
                    picker, indexes, values in
                    
                    if let v :[String] = values as? [String] {
                        self.tfPair.text = "\(v[0])/\(v[1])"
                    }
                    
                    return
            }, cancel: { ActionMultipleStringCancelBlock in return }, origin: textField)
            
            return false
        } else {
            return true
        }
    }
    
    
    @IBAction func didClickOpenMenuButton(_ sender: Any) {
        Util.sharedInstance.drawerController.toggle(.left, animated: true) { ( success ) in
        }
    }
}



//Tableview
extension MyOrdersVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier:  "MyOrdersTableViewCellIdentifier")!// as! UITableViewCell
        return defaultCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

