//
//  ViewController.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit
import SnapKit

class PlanetsViewController: UIViewController, CodableViews, UITableViewDelegate, UITableViewDataSource {
    
    private var planets: SolarSystem?
    private var presenter: PlanetsPresenter
    private var solarSystemPlanets: [String] = []
    
    lazy var planetsTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(PlanetsTableViewCell.self, forCellReuseIdentifier: PlanetsTableViewCell.identifier)
        table.rowHeight = PlanetsTableViewCell.RowHeight
        return table
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
        view.addSubview(planetsTableView)
    }
    
    func setupConstraints() {
        planetsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func additional() {
        fetchPlanetsData()
    }
    
}

extension PlanetsViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.solarSystemPlanets.count)
        return self.solarSystemPlanets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlanetsTableViewCell.identifier, for: indexPath) as! PlanetsTableViewCell
        cell.config(planet: .earth)
        return cell
    }
}

extension PlanetsViewController {
    
    private func successHandler() {
        DispatchQueue.main.async {
            self.planetsTableView.reloadData()
        }
    }
    
    private func errorHandler() {
        DispatchQueue.main.async {
            self.planetsTableView.backgroundColor = .red
        }
    }
    
    private func fetchPlanetsData() {
        presenter.fetchPlanetsData() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let solarSystem):
                self.planets = solarSystem
                self.fetchSolarSystemPlanets()
                self.successHandler()
            case .failure:
                self.errorHandler()
            }
        }
    }
    
    private func fetchSolarSystemPlanets() {
        guard let planets = self.planets else { return }
        self.solarSystemPlanets = presenter.filterPlanets(solarSystem: planets)
    }
}


