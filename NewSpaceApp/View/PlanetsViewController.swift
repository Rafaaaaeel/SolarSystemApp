//
//  ViewController.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit
import SnapKit


class PlanetsViewController: UIViewController, CodableViews, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        return view
    }()
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout.createLayoutPortrait())
        view.delegate = self
        view.dataSource = self
        view.isScrollEnabled = false
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
        view.addSubviews(titleLabelTop, titleLabelBottom, viewSquare, collection)
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
            make.width.equalTo(400)
            make.height.equalTo(400)
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
    }
    
}
