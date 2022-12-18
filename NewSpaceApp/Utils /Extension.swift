//
//  Extension.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 14/09/22.
//

import Foundation
import UIKit

//  MARK: - UIViewController
extension UIViewController {
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        
        
        statusBarView.backgroundColor = .systemBlue
        view.addSubview(statusBarView)
    }
    
    func setTabBarImage(imageName: String, title: String){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}

//  MARK: - UICollectionViewLayout
extension UICollectionViewLayout {
    
    func createLayoutPortrait() -> UICollectionViewCompositionalLayout {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: item,
            count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

//  MARK: - UITextField

extension UIView{
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 0.05)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

extension UIStackView{
    func addArregendSubViews(_ subviews: UIView...) {
        subviews.forEach(addArrangedSubview)
    }
}

extension UIColor {
    static var primaryBackground = UIColor(red: 24/255, green: 20/255, blue: 36/255, alpha: 1)
    static var mercury = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    static var venus = UIColor(red: 228/255, green: 212/255, blue: 176/255, alpha: 1)
    static var earth = UIColor(red: 112/255, green: 148/255, blue: 212/255, alpha: 1)
    static var mars = UIColor(red: 237/255, green: 126/255, blue: 84/255, alpha: 1)
    static var juptier = UIColor(red: 237/255, green: 174/255, blue: 133/255, alpha: 1)
    static var saturn = UIColor(red: 228/255, green: 212/255, blue: 172/255, alpha: 1)
    static var uranus = UIColor(red: 180/255, green: 220/255, blue: 228/255, alpha: 1)
    static var neptune = UIColor(red: 75/255, green: 123/255, blue: 252/255, alpha: 1)
}

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    final func register<T: UICollectionViewCell>(cellType: T.Type) where T: Reusable {
        self.register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
}


