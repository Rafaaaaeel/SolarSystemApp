//
//  PlanetsListDataSource.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 03/12/22.
//

import Foundation
import UIKit

class PlanetsListDataSource: NSObject {
    
    internal enum State {
        case loading
        case results
    }
    
    internal var state: State = .loading
    internal var solarSystem: SolarSystem? = nil
    internal var solarSystemPlanets: [String] = []
    var index = 0
    
    override init() {
        super.init()
    }
    
    
    internal func count() -> Int  {
        return solarSystemPlanets.count
    }
    
    internal func planets(index: Int) -> String? {
        switch state {
        case .loading:
            return nil
        case .results:
            return self.solarSystemPlanets[index]
        }
    }
}

extension PlanetsListDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch state {
        case .loading:
            return 8
        case .results:
            return count()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch state {
        case .loading:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetsViewShimmerCollectionViewCell.identifier, for: indexPath) as! PlanetsViewShimmerCollectionViewCell
            return cell
        case .results:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: PlanetsCollectionViewCell.identifier, for: indexPath) as! PlanetsCollectionViewCell
            if let planet = planets(index: indexPath.row) {
                cell.config(planet: planet, index: indexPath.row , indexSelected: index )
            }
            return cell
        }
    }
    
}

extension PlanetsListDataSource {
    
    private func orderPlanetsInOrder(range: Int, planets: [String]) {
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
        self.solarSystemPlanets = futurePlanetsHere
    }
    
    internal func filterPlanets() {
        var solarSystemPlanets: [String] = []
        guard let solarSystem = self.solarSystem else { return }
        solarSystem.bodies.forEach { planet in
            if planet.isPlanet {
                solarSystemPlanets.append(planet.englishName)
            }
        }
        orderPlanetsInOrder(range: solarSystemPlanets.count - 1, planets: solarSystemPlanets)
    }
}

