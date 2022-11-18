//
//  PlanetsCollectionViewCell.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit
import SnapKit

enum SolarSystemPlanets{
    case mercury
    case venus
    case earth
    case mars
    case juptier
    case saturn
    case uranus
    case netptune
}

class PlanetsTableViewCell: UITableViewCell, CodableViews {
    
    static let identifier = String(describing: PlanetsTableViewCell.self)
    static var RowHeight: CGFloat = 180
    
    lazy var imageView1: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PlanetsTableViewCell{
    
    func setupHierachy() {
        contentView.addSubview(imageView1)
        backgroundColor = .white
    }
    
    func setupConstraints() {
        
        imageView1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
extension PlanetsTableViewCell{
    func config(planet: SolarSystemPlanets){
        switch planet{
        case .mercury:
            let imageN = UIImage(named: "neptune")
            self.imageView1.image = imageN
            return
        case .venus:
            let imageN = UIImage(named: "neptune")
            self.imageView1.image = imageN
            return
        case .earth:
            let imageN = UIImage(named: "earth")
            self.imageView1.image = imageN
            return
        case .mars:
            let imageN = UIImage(named: "neptune")
            self.imageView1.image = imageN
            return
        case .juptier:
            let imageN = UIImage(named: "neptune")
            self.imageView1.image = imageN
            return
        case .saturn:
            let imageN = UIImage(named: "neptune")
            self.imageView1.image = imageN
            return
        case .uranus:
            let imageN = UIImage(named: "neptune")
            self.imageView1.image = imageN
            return
        case .netptune:
            let imageN = UIImage(named: "neptune")
            self.imageView1.image = imageN
            return
        }
    }
}


