//
//  DayDetailViewModel.swift
//  Forecast_MVVM
//
//  Created by Karl Pfister on 2/13/22.
//

import Foundation

protocol DayDetailViewDelegate: DayDetailsViewController {
    func updateViews()
}

class DayDetailViewModel {
    //MARK: - Properties
    var forcastData: TopLevelDictionary?
    var days: [Day] = []
    private weak var delegate: DayDetailViewDelegate?
    private var networkingController: NetworkingContoller
    
    
    init(delegate: DayDetailViewDelegate, networkController: NetworkingContoller = NetworkingContoller()) {
        self.delegate = delegate
        self.networkingController = networkController
        fetchForcastData()
    }
    
    private func fetchForcastData() {
        NetworkingContoller.fetchDays { result in
            switch result {
            case .success(let forcastData):
                self.forcastData = forcastData
                self.days = forcastData.days
                self.delegate?.updateViews()
            case .failure(let error):
                print("Error fetching the data!", error.errorDescription!)
            }
        }
    }
}
