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
    func filterPlanets(solarSystem: SolarSystem) -> [String]
}

class PlanetsPresenter: PlanetsPresenterOutputProtocol{

    var repository: PlanetsRepository
    var planets: SolarSystem?
    var solarSystemPlanets: [String] = []
    var view: PlanetsViewController?
    
    init(repository: PlanetsRepository) {
        self.repository = repository
        self.fetchSolarSystem()
    }
    
    func fetchSolarSystem() {
        self.fetchPlanetsData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let solarSystem):
                self.planets = solarSystem
                self.fetchSolarSystemPlanets()
                self.successHandler()
            case .failure:
                self.errorHandler()
            }
        }
    }

    private func successHandler() {
        DispatchQueue.main.async {
            self.view?.collection.reloadData()
        }
    }
    
    private func errorHandler() {
        DispatchQueue.main.async {
            self.view?.view.backgroundColor = .red
        }
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
    
    private func fetchSolarSystemPlanets() {
        guard let planets = self.planets else { return }
        self.solarSystemPlanets = self.filterPlanets(solarSystem: planets)
    }
    
}

// MARK: Business Logics

extension PlanetsPresenter {
    
    private func orderPlanetsInOrder(range: Int, planets: [String]) -> [String]{
        var futurePlanetsHere: [String] = []
        for _ in 0...range {
            futurePlanetsHere.append("")
        }
        
        for _ in planets {
            for k in planets {
                
                if k == SolarSystemPlanets.mercury.rawValue {
                    futurePlanetsHere[0] = SolarSystemPlanets.mercury.rawValue
                }
                
                if k == SolarSystemPlanets.venus.rawValue {
                    futurePlanetsHere[1] = SolarSystemPlanets.venus.rawValue
                }
                
                if k == SolarSystemPlanets.earth.rawValue {
                    futurePlanetsHere[2] = SolarSystemPlanets.earth.rawValue
                }
                
                if k == SolarSystemPlanets.mars.rawValue {
                    futurePlanetsHere[3] = SolarSystemPlanets.mars.rawValue
                }
                
                if k == SolarSystemPlanets.juptier.rawValue {
                    futurePlanetsHere[4] = SolarSystemPlanets.juptier.rawValue
                }
                
                if k == SolarSystemPlanets.saturn.rawValue {
                    futurePlanetsHere[5] = SolarSystemPlanets.saturn.rawValue
                }
                
                if k == SolarSystemPlanets.uranus.rawValue {
                    futurePlanetsHere[6] = SolarSystemPlanets.uranus.rawValue
                }
                
                if k == SolarSystemPlanets.netptune.rawValue {
                    futurePlanetsHere[7] = SolarSystemPlanets.netptune.rawValue
                }
        
            }
        }
        
        return futurePlanetsHere
    }
    
    func filterPlanets(solarSystem: SolarSystem) -> [String] {
        var solarSystemPlanets: [String] = []
        for planet in solarSystem.bodies {
            if planet.isPlanet {
                solarSystemPlanets.append(planet.englishName)
            }
        }
        print(solarSystemPlanets)
        let orderSolarSystem = orderPlanetsInOrder(range: solarSystemPlanets.count - 1, planets: solarSystemPlanets)
        return orderSolarSystem
    }
    
}
