//
//  ViewController.swift
//  MobTrader
//
//  Created by Heverton Rodrigues on 22/03/18.
//  Copyright © 2018 Slideworks. All rights reserved.
//

import UIKit
import ChameleonFramework

class TickerDetailsVC: UIViewController,
                            UITableViewDelegate, UITableViewDataSource,
                            UICollectionViewDelegate, UICollectionViewDataSource,
                                                    UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itens :Int = 200
    
    
    
    override func viewDidLoad() {
    }
    
}



//Tableview
extension TickerDetailsVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return itens
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell :TickerOrderTVC = tableView.dequeueReusableCell(withIdentifier:  "TickerOrderCell")! as! TickerOrderTVC
            cell.configure(green: ( indexPath.row <= (itens/2) ))

            return cell
        } else {
            let cell :TickerTradeTVC = tableView.dequeueReusableCell(withIdentifier:  "TickerTradeCell")! as! TickerTradeTVC
            cell.configure(green:(indexPath.row%3 == 0))
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            return collectionView.frame.size
        } else {
            return CGSize(width: 240, height: collectionView.frame.size.height)
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if indexPath.row == 0 {
            let cell :TickerCandleCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "TickerDetailChartCell",
                                                                           for: indexPath) as! TickerCandleCVC
            cell.configure()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TickerDetailOrderbookCell",
                                                          for: indexPath)// as! UICollectionViewCell
            
            let middleCell = Int((itens/2))
            
            (cell.viewWithTag(1) as! UITableView).scrollToRow(at: IndexPath(row: middleCell, section: 0), at: UITableViewScrollPosition.middle, animated: false)

            return cell
        }
    }
}

