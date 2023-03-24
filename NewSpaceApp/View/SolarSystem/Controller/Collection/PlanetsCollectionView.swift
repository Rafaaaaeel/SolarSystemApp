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
    internal var adapter: PlanetsListCollectionDelegate
    
    init(source: PlanetsListDataSource = PlanetsListDataSource(),
         adapter: PlanetsListCollectionDelegate = PlanetsListCollectionDelegate(),
         delegate: PlanetsListDelegate) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.source = source
        self.adapter = adapter
        self.adapter.delegate = delegate
        super.init(frame: .zero, collectionViewLayout: layout)
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
        self.delegate = self.adapter
        self.showsHorizontalScrollIndicator = false
        self.register(PlanetsCollectionViewCell.self, forCellWithReuseIdentifier: PlanetsCollectionViewCell.identifier)
        self.register(PlanetsViewShimmerCollectionViewCell.self, forCellWithReuseIdentifier: PlanetsViewShimmerCollectionViewCell.identifier)
    }
}


