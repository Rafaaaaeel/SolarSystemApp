//
//  PlanetsViewController+DataSource.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 25/11/22.
//

//import Foundation
//import UIKit
//
enum ViewState {
    case loading
    case ready
}

//extension PlanetsViewController{
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch self.presenter.state {
//            
//        case .loading:
//            return 8
//        case .ready:
//            return presenter.solarSystemPlanets.count
//        }
//        
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        switch self.presenter.state{
//            
//        case .loading:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetsViewShimmerCollectionViewCell.identifier, for: indexPath) as! PlanetsViewShimmerCollectionViewCell
//            return cell 
//        case .ready:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetsCollectionViewCell.identifier, for: indexPath) as! PlanetsCollectionViewCell
//            let planetName = self.presenter.solarSystemPlanets[indexPath.row]
//            cell.config(planet: planetName, index: indexPath.row)
//            return cell
//        }
//        
//
//    }
//    
//}
