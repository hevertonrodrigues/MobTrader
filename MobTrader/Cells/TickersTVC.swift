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

class TickersTVC: UITableViewCell {
    
    @IBOutlet weak var chartView: LineChartView!
    
    
    
    func configure(){
        
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        
//        // x-axis limit line
//        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
//        llXAxis.lineWidth = 4
//        llXAxis.lineDashLengths = [10, 10, 0]
//        llXAxis.labelPosition = .rightBottom
//        llXAxis.valueFont = .systemFont(ofSize: 10)
//
//        chartView.xAxis.gridLineDashLengths = [10, 10]
//        chartView.xAxis.gridLineDashPhase = 0
//
//        let ll1 = ChartLimitLine(limit: 150, label: "Upper Limit")
//        ll1.lineWidth = 4
//        ll1.lineDashLengths = [5, 5]
//        ll1.labelPosition = .rightTop
//        ll1.valueFont = .systemFont(ofSize: 10)
//
//        let ll2 = ChartLimitLine(limit: -30, label: "Lower Limit")
//        ll2.lineWidth = 4
//        ll2.lineDashLengths = [5,5]
//        ll2.labelPosition = .rightBottom
//        ll2.valueFont = .systemFont(ofSize: 10)
//
//        let leftAxis = chartView.leftAxis
//        leftAxis.removeAllLimitLines()
//        leftAxis.addLimitLine(ll1)
//        leftAxis.addLimitLine(ll2)
//        leftAxis.axisMaximum = 200
//        leftAxis.axisMinimum = -50
//        leftAxis.gridLineDashLengths = [5, 5]
//        leftAxis.drawLimitLinesBehindDataEnabled = true
        
        chartView.rightAxis.enabled = false
        
        chartView.legend.form = .empty
        
        chartView.animate(xAxisDuration: 2.5)

        
        self.setDataCount(10, range: 20)
    }
    
    
    func setDataCount(_ count: Int, range: UInt32) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(range) + 3)
            return ChartDataEntry(x: Double(i), y: val, icon: nil)
        }
        
        let set1 = LineChartDataSet(values: values, label: "DataSet 1")
        set1.drawIconsEnabled = false
        
        set1.lineDashLengths = [5, 2.5]
        set1.highlightLineDashLengths = [5, 2.5]
        set1.setColor(.black)
        set1.setCircleColor(.black)
        set1.lineWidth = 1
        set1.circleRadius = 3
        set1.drawCirclesEnabled = false
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 9)
        set1.formLineDashLengths = [5, 2.5]
        set1.formLineWidth = 1
        set1.formSize = 15
        

        
        let gradientColors = [ChartColorTemplates.colorFromString("#00000000").cgColor,
                              UIColor.flatBlueDark.cgColor]
        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
        set1.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set1)
        
        chartView.data = data
    }
}
