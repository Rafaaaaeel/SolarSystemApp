//
//  PlanetsViewShimmerCollectionViewCell.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 03/12/22.
//

import UIKit

class PlanetsViewShimmerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PlanetsViewShimmerCollectionViewCell.self)
    
    lazy var shimmerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PlanetsViewShimmerCollectionViewCell: CodableViews {
    func setupHierachy() {
        addSubview(shimmerView)
    }
    
    func setupConstraints() {
        shimmerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(110)
            make.height.equalTo(20)
        }
    }
    
    
}
