//
//  ViewController.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit
import SnapKit

class PlanetsViewController: UIViewController, UICollectionViewDelegate, CodableViews, UICollectionViewDataSource {
    
    var planets: SolarSystem?
    var apiClient = APIClient.shared
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout.createLayoutPortrait())
        view.delegate = self
        view.dataSource = self
        view.register(PlanetsCollectionViewCell.self, forCellWithReuseIdentifier: PlanetsCollectionViewCell.identifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}
extension PlanetsViewController{
    func setupHierachy() {
        view.addSubview(collection)
    }
    
    func setupConstraints() {
        collection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func additional() {
        fetchData()
    }
    
}

extension PlanetsViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.planets?.bodies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetsCollectionViewCell.identifier, for: indexPath) as! PlanetsCollectionViewCell
        cell.config(planet: .earth)
        return cell
    }
}



extension PlanetsViewController{
    
    private func fetchData(){
        apiClient.fetchPlanetsData{ [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.planets = success
                print(self.planets)
                self.updateCollection()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    private func updateCollection() {
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
    
}
