//
//  DayDetailsViewController.swift
//  Forecast_MVVM
//
//  Created by Karl Pfister on 2/13/22.
//

import UIKit

class DayDetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var dayForcastTableView: UITableView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentHighLabel: UILabel!
    @IBOutlet weak var currentLowLabel: UILabel!
    @IBOutlet weak var currentDescriptionLabel: UILabel!
    
    //MARK: - Properties
    
    var viewModel: DayDetailViewModel?
    
    //MARK: - View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Conform to the TBVS Protocols
        dayForcastTableView.delegate = self
        dayForcastTableView.dataSource = self
        
        viewModel = DayDetailViewModel(delegate: self)
    }
    
   
}


//MARK: - Extenstions
extension DayDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.forecastData?.days.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath) as? DayForcastTableViewCell else {return UITableViewCell()}
        let day = viewModel!.days[indexPath.row]
        cell.updateViews(day: day)
        return cell
    }
}

extension DayDetailsViewController: DayDetailViewDelegate {
    func updateView() {
        let currentDay = viewModel!.days[0]
        DispatchQueue.main.async {
            self.cityNameLabel.text = self.viewModel?.forecastData?.cityName
            self.currentDescriptionLabel.text = currentDay.weather.description
            self.currentTempLabel.text = "\(currentDay.temp)F"
            self.currentLowLabel.text = "\(currentDay.lowTemp)F"
            self.currentHighLabel.text = "\(currentDay.highTemp)F"
            self.dayForcastTableView.reloadData()
        }
    }
}
