//
//  PlanetsPresenter.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation

protocol PlanetsPresenterOutputProtocol {
    func fetchPlanetsData(completion: @escaping (Result<SolarSystem, Error>) -> Void?)
    func filterPlanets(solarSystem: SolarSystem) -> [String]
}

class PlanetsPresenter: PlanetsPresenterOutputProtocol{

    var repository: PlanetsRepository
    
    init(repository: PlanetsRepository) {
        self.repository = repository
    }

    func fetchPlanetsData(completion: @escaping (Result<SolarSystem, Error>) -> Void?) {
        repository.fetchPlanetsData() { result in
            switch result {
            case .success(let solarSystem):
                completion(.success(solarSystem))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func filterPlanets(solarSystem: SolarSystem) -> [String] {
        var solarSystemPlanets: [String] = []
        for planet in solarSystem.bodies {
            if planet.isPlanet {
                solarSystemPlanets.append(planet.englishName)
                print(planet.englishName)
            }
        }
        return solarSystemPlanets
    }
    
}
