//
//  Util.swift
//  JSMVendedores
//
//  Created by Heverton Rodrigues on 05/12/17.
//  Copyright © 2017 Heverton Rodrigues. All rights reserved.
//

import UIKit
//import SVProgressHUD
import MMDrawerController


class K {
    static let BASE_URL = ""
}

class Util {
    static let sharedInstance = Util()
    
    var drawerController :MMDrawerController!
    
    var params :[Any?] = []

    func configApp(){
//        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient)
        
        self.drawerController = MMDrawerController(
            center: UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController(),
            leftDrawerViewController: UIStoryboard(name: "Menu", bundle: nil).instantiateInitialViewController()
        )
        
        self.drawerController.restorationIdentifier = "MMDrawer"
        self.drawerController.centerHiddenInteractionMode = .full
    }
    
    func openController( vc :Any? ){
        self.drawerController.closeDrawer(animated: true, completion: nil)
        
        if let viewController = vc as? UIViewController {
            self.drawerController.centerViewController = viewController
        } else if let navController = vc as? UINavigationController {
            self.drawerController.centerViewController = navController
        } else if let tableViewController = vc as? UITableViewController {
            self.drawerController.centerViewController = tableViewController
        }
    }
    
 
}
