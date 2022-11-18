//
//  Coordinator.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 11/11/22.
//

import Foundation
import UIKit

enum Event{
    case buttonTapped
}

protocol Coordinator{
    var navigationController: UINavigationController? { get set }
    func start() -> UIViewController
}


protocol Coordinating{
    var coordinator: Coordinator? { get set }
}
