//
//  ViewController.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit
import SnapKit

class PlanetsViewController: UIViewController, UICollectionViewDelegate, CodableViews, UICollectionViewDataSource {
    
    private var planets: SolarSystem?
    private var presenter: PlanetsPresenter
    
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
    
    init(presenter: PlanetsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - Life cycle
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
        fetchPlanetsData()
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

extension PlanetsViewController {
    
    private func successHandler() {
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
    
    private func errorHandler() {
        view.backgroundColor = .red
    }
    
    private func fetchPlanetsData() {
        presenter.fetchPlanetsData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let solarSystem):
                self.planets = solarSystem
                self.successHandler()
            case .failure:
                self.errorHandler()
            }
        }
    }
}


