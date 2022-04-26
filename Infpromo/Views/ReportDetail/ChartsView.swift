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
        chart.backgroundColor = .green
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

        if yValues.count == 7 {
            for x in 0..<7 {
                lineChartValues.append(.init(x: Double(x), y: yValues[x]))
            }
        }

        let setLineChart = LineChartDataSet(entries: lineChartValues)
        let dataLineChart = LineChartData(dataSet: setLineChart)
        lineChartView.data = dataLineChart
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
        lineChartView.xAxis.granularity = 1
        lineChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
    }
    
}
