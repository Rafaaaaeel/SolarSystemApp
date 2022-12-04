//
//  PlanetsPresenter.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation
import UIKit

protocol PlanetsPresenterOutputProtocol {
    func fetchSolarSystem()
    func fetchPlanetsData(completion: @escaping (Result<SolarSystem, Error>) -> Void?)
}

class PlanetsPresenter: PlanetsPresenterOutputProtocol {

    var repository: PlanetsRepository
    weak var view: PlanetsViewController?
    
    init(repository: PlanetsRepository) {
        self.repository = repository
        self.fetchSolarSystem()
    }
    
    internal func fetchSolarSystem() {
        self.fetchPlanetsData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let solarSystem):
                self.fetchSolarSystemSourceData(solarSystem: solarSystem)
                self.successHandler()
            case .failure:
                self.errorHandler()
            }
        }
    }

    private func successHandler() {
        DispatchQueue.main.async {
            self.view?.collection.source.state = .results
            self.view?.collection.reloadData()
        }
    }
    
    private func errorHandler() {
        DispatchQueue.main.async {
            self.view?.view.backgroundColor = .red
        }
    }
    
    internal func fetchPlanetsData(completion: @escaping (Result<SolarSystem, Error>) -> Void?) {
        repository.fetchPlanetsData() { result in
            switch result {
            case .success(let solarSystem):
                completion(.success(solarSystem))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func fetchSolarSystemSourceData(solarSystem: SolarSystem) {
        self.view?.collection.add(solarSystem: solarSystem)
    }
    
}
