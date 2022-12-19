//
//  ViewController.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit
import SnapKit

class SolarSystemViewController: UIViewController {
    
    var presenter: SolarSystemPresenter
    var hapticFeedback = UINotificationFeedbackGenerator()

    let spinnerLoadView = SpinnerViewController()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = """
                    SELECT YOUR
                    DESTINATION
                    """
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var solarSystemView: SolarSystemView = {
        let view = SolarSystemView()
        view.rotate(isOn: false)
        view.layer.opacity = 0.2
        return view
    }()
    
    lazy var collection: PlanetsCollectionView = {
        let collection = PlanetsCollectionView(delegate: self)
        return collection
    }()
    
    init(presenter: SolarSystemPresenter) {
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

extension SolarSystemViewController: CodableViews {
    
    func setupHierachy() {
        view.addSubviews(titleLabel, solarSystemView, collection)
        addChild(spinnerLoadView)
        view.addSubview(spinnerLoadView.view)
        spinnerLoadView.didMove(toParent: self)
    }

    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
        solarSystemView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(390)
            make.height.equalTo(390)
        }
        
        collection.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(solarSystemView.snp.bottom)
        }
    }
    
    func additional() {
        view.backgroundColor = .primaryBackground
        self.setContentScrollView(collection)
        collection.backgroundColor = .primaryBackground
        spinnerLoadView.view.frame = view.frame
        presenter.view = self
    }
    
}

extension SolarSystemViewController {
    
    private func getCurrentVisibleCellRow() -> Int {
        var visibleRect = CGRect ( )
        visibleRect.origin = collection.contentOffset
        visibleRect.size = collection.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        if let indexPath = collection.indexPathForItem(at: visiblePoint) {
            return indexPath.row
        }
        return 0
    }
    
}

extension SolarSystemViewController: PlanetsListDelegate {
    
    func didScroll() {
        print("YEEEEEEES")
        print(getCurrentVisibleCellRow())
    }
    
    func didSelectPlanet(at index: Int) {
        let selectedPlanet = collection.source.solarSystemPlanets[index]
        print(selectedPlanet)
        solarSystemView.whichOneIsSelected = index
        presenter.fetchPlanetData(planet: selectedPlanet)
        hapticFeedback.notificationOccurred(.success)
    }

}

