//
//  PlanetsCollectionViewCell.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit
import SnapKit

protocol PlanetsCollectionViewCellDelegate: AnyObject {
    func didTouchPlanet(planet: String)
}

class PlanetsCollectionViewCell: UICollectionViewCell, CodableViews {
    
    static let identifier = String(describing: PlanetsCollectionViewCell.self)
    
    weak var delegate: PlanetsCollectionViewCellDelegate?
    
    let width: CGFloat = 2
    let height: CGFloat = 2
    let offset: CGFloat = 5
    var planet: String = ""
    
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
    
    lazy var planetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.gray, for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.addTarget(self, action: #selector(didPlanetClicked), for: .touchUpInside)
        return button
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
        
        addSubviews(planetButton, dotViewRight, dotViewLeft)
        
    }
    
    func setupConstraints() {
        
        planetButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dotViewRight.snp.makeConstraints { make in
            make.trailing.equalTo(planetButton).offset(offset)
            make.centerY.equalTo(planetButton)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
        dotViewLeft.snp.makeConstraints { make in
            make.leading.equalTo(planetButton).offset(-offset)
            make.centerY.equalTo(planetButton)
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        
    }
    
}

extension PlanetsCollectionViewCell {
    func config(planet name: String, index: Int) {
        self.planet = name
        if index == 0 {
            planetButton.isEnabled = true
        }
        
        planetButton.setTitle(name, for: [])
    }
}

extension PlanetsCollectionViewCell {
    
    
    @objc func didPlanetClicked() {
        delegate?.didTouchPlanet(planet: self.planet)
    }
    
}
    



