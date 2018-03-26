//
//  ViewController.swift
//  MobTrader
//
//  Created by Heverton Rodrigues on 22/03/18.
//  Copyright © 2018 Slideworks. All rights reserved.
//

import UIKit
import Charts
import ChameleonFramework


class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chartView: PieChartView!
    
    var itens :[Portfolio] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Portfolio.getAll(nil, onSuccess: { (result) in
            
            self.itens = result
            self.setDataCount(
                data: self.itens,
                centerText: "Total value",
                chartView: self.chartView
            )
            
        }) { (error, params) in
            //Alert de erro
        }
        
        
        
    }

    @IBAction func didClickOpenMenuButton(_ sender: Any) {
        Util.sharedInstance.drawerController.toggle(.left, animated: true) { ( success ) in
        }
    }
    
}


//Chart Setup
extension HomeVC {
    
    func setDataCount(data: [Portfolio], centerText: String, chartView: PieChartView) {
        self.setup(pieChartView: chartView, centerText: centerText)
        
        var entries: [PieChartDataEntry] = []
        var colors: [NSUIColor] = []
        
        for item in data {
//            if let value = dict["value"] as? Double, let label = dict["label"] as? String, let color = dict["color"] as? UIColor {
                entries.append(PieChartDataEntry(value: item.amount,
                                                 label: item.name,
                                                  icon: nil)
                )

                colors.append(UIColor.randomFlat)
//            }
        }

        
        let set = PieChartDataSet(values: entries, label: "")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        set.colors = colors
        
        
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.white)
        
        chartView.data = data
        chartView.highlightValues(nil)
    }
    
    
    func setup(pieChartView chartView: PieChartView, centerText :String) {
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.58
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5, top: 10, right: 5, bottom: 5)
        chartView.drawEntryLabelsEnabled = false
        chartView.drawCenterTextEnabled = true
        
        let paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        
        
        
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        
        let centerText = NSMutableAttributedString(string: centerText,
                                                   attributes: [ NSAttributedStringKey.paragraphStyle: style ])
        
        chartView.centerAttributedText = centerText;
        
        
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true
        
        let l = chartView.legend
        l.horizontalAlignment = .right
        l.verticalAlignment = .top
        l.orientation = .vertical
        l.drawInside = false
        l.xEntrySpace = 7
        l.yEntrySpace = 0
        l.yOffset = 0
        //        chartView.legend = l
    }
    
}


//TableViewDelegate
extension HomeVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itens.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :HomeCurrencyTVC = tableView.dequeueReusableCell(withIdentifier:  "HomeCurrencyTableViewCellIdentifier")! as! HomeCurrencyTVC
        cell.configure(item: self.itens[indexPath.row])
        return cell
    }

}
