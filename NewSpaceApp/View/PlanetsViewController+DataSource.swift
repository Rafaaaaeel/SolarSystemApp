//
//  PlanetsViewController+DataSource.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 25/11/22.
//

import Foundation
import UIKit


extension PlanetsViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.solarSystemPlanets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetsCollectionViewCell.identifier, for: indexPath) as! PlanetsCollectionViewCell
        let planetName = self.presenter.solarSystemPlanets[indexPath.row]
        cell.config(planet: planetName, index: indexPath.row)
        return cell
    }
    
}
