//
//  ApplicationCoordinator.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 11/11/22.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func start() -> UIViewController {
        return setupViewController()
    }
    
    private func setupViewController() -> UIViewController{
        let repository = PlanetsRepository()
        let Presenter = PlanetsPresenter(repository: repository)
        
        return PlanetsViewController(presenter: Presenter)
    }
    
    
}

