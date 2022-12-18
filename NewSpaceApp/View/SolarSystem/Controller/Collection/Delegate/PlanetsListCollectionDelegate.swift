//
//  PlanetsListDelegate.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 09/12/22.
//

import Foundation
import UIKit


protocol PlanetsListDelegate: AnyObject {
    func didScroll()
    func didSelectPlanet(at index: Int)
}

class PlanetsListCollectionDelegate: NSObject {
    
    weak var delegate: PlanetsListDelegate?
    
    override init() {
        super.init()
    }
    
}

extension PlanetsListCollectionDelegate: UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.didScroll()
        
        print(scrollView.contentOffset.x)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectPlanet(at: indexPath.row)
    }

}
