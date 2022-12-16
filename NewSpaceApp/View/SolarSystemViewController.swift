//
//  ViewController.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit
import SnapKit

class SolarSystemViewController: UIViewController {
    
    var presenter: PlanetsPresenter
    
    lazy var titleLabelTop: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "SELECT YOUR"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var titleLabelBottom: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "DESTINATION"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var viewSquare: UIView = {
        let view = UIView()
        view.layer.cornerRadius = self.view.frame.size.width / 2
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1.0
        view.isHidden = true
        return view
    }()
    
    lazy var viewSquareShimmer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = self.view.frame.size.width / 2
        view.clipsToBounds = true
        view.backgroundColor = .gray
        view.layer.borderWidth = 1.0
        return view
    }()
    
    lazy var collection: PlanetsCollectionView = {
        let collection = PlanetsCollectionView(delegate: self)
        return collection
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

extension SolarSystemViewController: CodableViews {
    
    func setupHierachy() {
        view.addSubviews(titleLabelTop, titleLabelBottom, viewSquare, collection, viewSquareShimmer)
    }

    func setupConstraints() {
        titleLabelTop.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.horizontalEdges.equalToSuperview()
        }
        
        titleLabelBottom.snp.makeConstraints { make in
            make.top.equalTo(titleLabelTop.snp.bottom)
            make.horizontalEdges.equalToSuperview()
        }
        
        viewSquare.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(390)
            make.height.equalTo(390)
        }
        
        viewSquareShimmer.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(390)
            make.height.equalTo(390)
        }
        
        collection.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(viewSquare.snp.bottom)
        }
    }
    
    func additional() {
        collection.backgroundColor = .blueTest
        view.backgroundColor = .blueTest
        presenter.view = self
        self.setContentScrollView(collection)
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
    }

    
}
