//
//  PlanetsCollectionViewCell.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import UIKit

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

class PlanetsCollectionViewCell: UICollectionViewCell, CodableViews {
    
    static let identifier = String(describing: PlanetsCollectionViewCell.self)
    
    internal var imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PlanetsCollectionViewCell{
    
    func setupHierachy() {
        contentView.addSubview(imageView)
        backgroundColor = .white
    }
    
    func setupConstraints() {
        imageView.frame = contentView.bounds
    }
    
}
extension PlanetsCollectionViewCell{
    func config(planet: SolarSystemPlanets){
        switch planet{
        case .mercury:
            let imageN = UIImage(named: "neptune")
            self.imageView.image = imageN
            return
        case .venus:
            let imageN = UIImage(named: "neptune")
            self.imageView.image = imageN
            return
        case .earth:
            let imageN = UIImage(named: "earth")
            self.imageView.image = imageN
            return
        case .mars:
            let imageN = UIImage(named: "neptune")
            self.imageView.image = imageN
            return
        case .juptier:
            let imageN = UIImage(named: "neptune")
            self.imageView.image = imageN
            return
        case .saturn:
            let imageN = UIImage(named: "neptune")
            self.imageView.image = imageN
            return
        case .uranus:
            let imageN = UIImage(named: "neptune")
            self.imageView.image = imageN
            return
        case .netptune:
            let imageN = UIImage(named: "neptune")
            self.imageView.image = imageN
            return
        }
    }
}


