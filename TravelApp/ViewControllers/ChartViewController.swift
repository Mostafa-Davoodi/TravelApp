//
//  ChartViewController.swift
//  TravelApp
//
//  Created by Mostafa Davoodi on 11/16/21.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
	
	lazy var chart: PieChartView = {
		let chart = PieChartView()
		chart.translatesAutoresizingMaskIntoConstraints = false
		return chart
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
	
		view.addSubview(chart)
		
		NSLayoutConstraint.activate([
			chart.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			chart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			chart.widthAnchor.constraint(equalToConstant: 300),
			chart.heightAnchor.constraint(equalToConstant: 300),
		])
		
		
		
		let trump = PieChartDataEntry(value: 70.3, label: "TRUMP")
		let biden = PieChartDataEntry(value: 65.4, label: "BIDEN")
		let set = PieChartDataSet(entries: [trump, biden], label: "USA ELECTION")
		
		set.colors = ChartColorTemplates.liberty()
								+ ChartColorTemplates.colorful()
								+ ChartColorTemplates.vordiplom()
								+ ChartColorTemplates.joyful()
								+ ChartColorTemplates.pastel()
								+ [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
		
		let pieChartData = PieChartData(dataSet: set)
		chart.data = pieChartData
	
	}
	
}

