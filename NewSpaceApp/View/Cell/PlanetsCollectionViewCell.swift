//
//  PlanetsCollectionViewCell.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit
import SnapKit



class PlanetsCollectionViewCell: UICollectionViewCell, CodableViews {
    
    static let identifier = String(describing: PlanetsCollectionViewCell.self)
    
    let width: CGFloat = 2
    let height: CGFloat = 2
    let offset: CGFloat = 5
    
    lazy var dotViewRight: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    lazy var dotViewLeft: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.layer.opacity = 0.5
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    

extension PlanetsCollectionViewCell {
    
    func setupHierachy() {
        
        addSubviews(label, dotViewRight, dotViewLeft)
        
    }
    
    func setupConstraints() {
        
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dotViewRight.snp.makeConstraints { make in
            make.trailing.equalTo(label).offset(offset)
            make.centerY.equalTo(label)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
        dotViewLeft.snp.makeConstraints { make in
            make.leading.equalTo(label).offset(-offset)
            make.centerY.equalTo(label)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
    }
    
}

extension PlanetsCollectionViewCell {
    func config(planet name: String, index: Int) {
    
        if index == 0 {
            label.layer.opacity = 1
        }
        
        label.text = name
    }
}
    



