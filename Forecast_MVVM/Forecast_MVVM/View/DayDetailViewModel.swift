//
//  DayDetailViewModel.swift
//  Forecast_MVVM
//
//  Created by Arian Mohajer on 2/14/22.
//

import Foundation

class DayDetailViewModel {
    var forecastData: TopLevelDictionary?
    
    var days: [Day] {
        return forecastData?.days ?? []
    }
    
    private weak var delegate: DayDetailViewDelegate?
    private let networkingController: NetworkingContoller
    
    private func fetchForecastData() {
        NetworkingContoller.fetchDays { result in
            switch result {
                
            case .success(let topLevelDictionary):
                self.forecastData = topLevelDictionary
                self.delegate?.updateView()
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
    
    init(delegate: DayDetailViewDelegate, networkingController: NetworkingContoller = NetworkingContoller()) {
        self.delegate = delegate
        self.networkingController = networkingController
        fetchForecastData()
    }
}

protocol DayDetailViewDelegate where Self: DayDetailsViewController {
    func updateView()
}
