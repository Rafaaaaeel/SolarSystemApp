//
//  PlanetsCollectionView.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 03/12/22.
//

import Foundation
import UIKit

internal class PlanetsCollectionView: UICollectionView {
    
    internal var source: PlanetsListDataSource
    
    init(source: PlanetsListDataSource = PlanetsListDataSource()) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        self.source = source
        super.init(frame: .zero, collectionViewLayout: layout.createLayoutPortrait())
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func add(solarSystem: SolarSystem) {
        source.solarSystem = solarSystem
        source.filterPlanets()
    }
}

extension PlanetsCollectionView {
    
    internal func configure() {
        self.dataSource = self.source
        self.isScrollEnabled = false
        self.register(PlanetsCollectionViewCell.self, forCellWithReuseIdentifier: PlanetsCollectionViewCell.identifier)
        self.register(PlanetsViewShimmerCollectionViewCell.self, forCellWithReuseIdentifier: PlanetsViewShimmerCollectionViewCell.identifier)
    }
    
}

