//
//  ChartsView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 26.04.2022.
//

import Foundation
import UIKit
import Charts

class ChartsView: UIView {
    
    private let lineChartView: LineChartView = {
       let chart = LineChartView()
        chart.backgroundColor = .white
        
        chart.borderLineWidth = 3.0
        chart.gridBackgroundColor = .gray
        chart.xAxis.labelRotationAngle = -30
 
        
//        chart.xAxis.gridLineDashPhase = 0.0
        chart.xAxis.gridColor = .lightGray.withAlphaComponent(0.5)
        chart.xAxis.gridLineWidth = 1
        chart.xAxis.gridLineCap = .butt
        chart.xAxis.gridLineDashLengths = [2.0]
        
        chart.leftAxis.gridColor = .lightGray.withAlphaComponent(0.5)
        chart.leftAxis.gridLineWidth = 1
        chart.leftAxis.gridLineCap = .butt
        chart.leftAxis.gridLineDashLengths = [2.0]
        
        chart.rightAxis.gridColor = .lightGray.withAlphaComponent(0.5)
        chart.rightAxis.gridLineWidth = 1
        chart.rightAxis.gridLineCap = .butt
        chart.rightAxis.gridLineDashLengths = [2.0]
        
        chart.highlightPerTapEnabled = false
        chart.highlightPerDragEnabled = false
        
        chart.rightAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawAxisLineEnabled = false
        
        return chart
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lineChartView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lineChartView.frame = bounds
    }
    
    func prepareChartsWithData(yValues: [Double], labels: [String]) {

        
        
        var lineChartValues: [ChartDataEntry] = []
        
        let intY = yValues.map({Int($0)})
        
        
       
        
        if yValues.count == 7 {
            for x in 0..<7 {
                lineChartValues.append(.init(x: Double(x), y: yValues[x]))
            }
        }

        let setLineChart = LineChartDataSet(entries: lineChartValues, label: "")
        
        setLineChart.circleRadius = 6.6
        setLineChart.circleColors = [NSUIColor().infpromo]
        setLineChart.colors = [NSUIColor().infpromo]
        setLineChart.valueTextColor = .clear
        setLineChart.lineWidth = 1
        
        
        let dataLineChart = LineChartData(dataSet: setLineChart)
        
        lineChartView.data = dataLineChart
        
        
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
        lineChartView.xAxis.axisLineColor = UIColor().infpromo
        lineChartView.xAxis.granularity = 1

        lineChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        lineChartView.rightAxis.drawLabelsEnabled = false
        lineChartView.legend.form = .none
        
        lineChartView.leftAxis.valueFormatter = YAxisValueFormatter()
        lineChartView.leftAxis.axisLineColor = UIColor().infpromo
        lineChartView.leftAxis.granularity = 1
//        lineChartView.leftAxis.labelPosition = YAxis.LabelPosition.insideChart
        
        
        
        
    }
    
}

class YAxisValueFormatter: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let intOne = Int(value)
        let stringOne = intOne.roundedWithAbbreviations
        
        return String(stringOne)
    }
}

