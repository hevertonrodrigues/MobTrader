//
//  ViewController.swift
//  MobTrader
//
//  Created by Heverton Rodrigues on 22/03/18.
//  Copyright © 2018 Slideworks. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didClickLoginButton(_ sender: Any) {

        if let appDelegate :AppDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            SlideMenuOptions.leftViewWidth = 300
            SlideMenuOptions.contentViewScale = 1
            
            let slideMenuController = SlideMenuController(
                mainViewController: UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!,
                leftMenuViewController: UIStoryboard(name: "Menu", bundle: nil).instantiateInitialViewController()! )
            
            appDelegate.window?.rootViewController = slideMenuController
        }
        
    }
    
}

