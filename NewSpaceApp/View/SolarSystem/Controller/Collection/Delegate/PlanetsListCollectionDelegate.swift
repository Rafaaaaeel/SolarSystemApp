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
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectPlanet(at: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 180, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 110, bottom: 0, right: 110)
    }
}
