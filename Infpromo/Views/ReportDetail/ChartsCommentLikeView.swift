//
//  ChartsCommentLikeView.swift
//  Infpromo
//
//  Created by BaranK Kutlu on 9.05.2022.
//

import UIKit
import Charts

class ChartsCommentLikeView: UIView, IValueFormatter {
    

    private let barChartView: BarChartView = {
       let chart = BarChartView()
        chart.backgroundColor = .white
        chart.xAxis.labelRotationAngle = -30
        
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
    
    let firstX = [0.8, 1.8, 2.8, 3.8, 4.8, 5.8, 6.8, 7.8]
    let secondX = [1.2, 2.2, 3.2, 4.2, 5.2, 6.2, 7.2, 8.2]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(barChartView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        barChartView.frame = bounds
    }
    
    func handleChart(likes: [Int], comments: [Int], created: [String]) {
        var barChartDatasFirst: [BarChartDataEntry] = []
        var barChartDatasSecond: [BarChartDataEntry] = []
        
        var doubleLikes: [Double] = []
        doubleLikes.append(contentsOf: likes.compactMap({Double($0)}))
        
        var doubleComments: [Double] = []
        doubleComments.append(contentsOf: comments.compactMap({Double($0)}))
        
        
        for x in 0..<8 {
            barChartDatasFirst.append(.init(x: firstX[x], y: doubleLikes[x]))
            barChartDatasSecond.append(.init(x: secondX[x], y: doubleComments[x]))
        }
        
        let formattedDate = dateOrganize(dateArray: created)
        
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: formattedDate)
        barChartView.xAxis.granularity = 1
        barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        
        let setBarChartDataEntriesFirst = BarChartDataSet(entries: barChartDatasFirst, label: "")
        setBarChartDataEntriesFirst.colors = [NSUIColor.systemBlue]
        setBarChartDataEntriesFirst.valueFormatter = self
        
        let setBarChartDataEntriesSecond = BarChartDataSet(entries: barChartDatasSecond, label: "")
        setBarChartDataEntriesSecond.colors = [NSUIColor.systemYellow]
       
        setBarChartDataEntriesSecond.valueFormatter = self
        barChartView.data = BarChartData(dataSets: [setBarChartDataEntriesFirst, setBarChartDataEntriesSecond])
        
        barChartView.rightAxis.drawLabelsEnabled = false
        barChartView.legend.form = .none
        barChartView.barData?.barWidth = 0.4
        
        barChartView.leftAxis.valueFormatter = YAxisValueFormatter()
        barChartView.leftAxis.granularity = 1
        
       
        
        
        
    }
    
    func dateOrganize(dateArray: [String]) -> [String] {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyy-MM-dd'T'HH:mm:ss.SSSZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMM YY"
        var dates: [String] = []
        for i in 0..<dateArray.count {
            if let date = dateFormatterGet.date(from: dateArray[i]) {
                dates.append(dateFormatterPrint.string(from: date))
            }
        }
        
        print(dates)
        
        return dates
        
    }
    
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        let intOne = Int(value)
        let stringOne = intOne.roundedWithAbbreviations
        
        return String(stringOne)
    }
    
    

}



