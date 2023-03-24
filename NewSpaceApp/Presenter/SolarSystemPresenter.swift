//
//  PlanetsPresenter.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation
import UIKit

protocol PlanetsPresenterOutputProtocol {
    func fetchPlanet(planet name: String)
    func fetchSolarSystem()
}

final class SolarSystemPresenter: PlanetsPresenterOutputProtocol {

    var repository: SolarSystemRepository
    var coordinator: PlanetInfoCoordinator
    weak var view: SolarSystemViewController?
    
    init(repository: SolarSystemRepository,
         coordinator: PlanetInfoCoordinator) {
        self.repository = repository
        self.coordinator = coordinator
        self.fetchSolarSystem()
    }
        
    internal func fetchSolarSystem() {
        Task {
            await fetchSolarSystemData()
        }
    }
    
    internal func fetchPlanet(planet name: String) {
        Task {
            await fetchPlanetData(planet: name)
        }
    }
    
    private func fetchSolarSystemData() async {
        do {
            let data = try await repository.fetchSolarSystemData()
            self.fetchSolarSystemSourceData(solarSystem: data)
            self.successHandler()
        } catch {
            self.errorHandler()
        }
    }
    
    private func fetchPlanetData(planet name: String) async {
        do {
            let planets = try await repository.fetchPlanetData(planet: name)
            if let moons = planets.moons {
                await fetchMoonsData(moons: moons)
            }
        } catch {
            self.errorHandler()
        }
    }
    
    private func fetchMoonsData(moons: [Moon]) async {
        moons.forEach { moon in
            Task {
                let rel = moon.rel.components(separatedBy: "/")
                if let name = rel.last {
                    let moon = try await self.repository.fetchPlanetData(planet: name)
                    print("------------> \(moon.englishName)")
                }
            }
        }
    }
    
    internal func callPlanetViewController() {
        let viewControllrer = coordinator.start()
//        view?.pushViewController(viewControllrer, animated: true)
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
