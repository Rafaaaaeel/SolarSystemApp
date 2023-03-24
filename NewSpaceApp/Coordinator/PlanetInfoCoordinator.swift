import UIKit

class PlanetInfoCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        return setupViewController()
    }
    
    private func setupViewController() -> UIViewController{
        return PlanetViewController()
    }
    
}
