import UIKit
import SnapKit

class PlanetViewController: UIViewController {
    
    lazy var planetImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "neptune")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}

extension PlanetViewController: CodableViews {
    
    func setupHierachy() {
        view.addSubview(planetImage)
    }
    
    func setupConstraints() {
        planetImage.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
    }
    
    func additional() {
        view.backgroundColor = .primaryBackground
    }
    
}

extension PlanetViewController {
    
}
