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

class SolarSystemPresenter: PlanetsPresenterOutputProtocol {

    var repository: SolarSystemRepository
    weak var view: SolarSystemViewController?
    
    init(repository: SolarSystemRepository) {
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
    
    internal func fetchPlanetsData(completion: @escaping (Result<SolarSystem, Error>) -> Void?) {
        repository.fetchSolarSystemData() { result in
            switch result {
            case .success(let solarSystem):
                completion(.success(solarSystem))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
//  It needs to be refactored later
    internal func fetchPlanetData(planet: String) {
        
        repository.fetchPlanetData(planet: planet) { result in
            switch result {
            case .success(let planet):
                if let moons = planet.moons {
                    moons.forEach { moon in
                        let moon = moon.rel.components(separatedBy: "/")
                        let moonName = moon[moon.count - 1]
                        self.repository.fetchPlanetData(planet: moonName) { result in
                            switch result {
                            case .success(let moon):
                                print("------------> \(moon.englishName)")
                            case .failure(_):
                                break
                            }
                        }
                    }
                }
            case .failure(_):
                break
            }
        }
    }
    
}


// MARK: - Private methods
extension SolarSystemPresenter {
    
    private func fetchSolarSystemSourceData(solarSystem: SolarSystem) {
        self.view?.collection.add(solarSystem: solarSystem)
    }
    
    private func successHandler() {
        DispatchQueue.main.async {
            self.view?.collection.source.state = .results
            self.view?.solarSystemView.isHidden = false
            self.view?.collection.reloadData()
            self.view?.spinnerLoadView.willMove(toParent: nil)
            self.view?.spinnerLoadView.view.removeFromSuperview()
            self.view?.spinnerLoadView.removeFromParent()
            self.view?.solarSystemView.rotate(isOn: true)
            self.view?.solarSystemView.layer.opacity = 1
        }
    }
    
    private func errorHandler() {
        DispatchQueue.main.async {
            self.view?.view.backgroundColor = .red
        }
    }
    
}
