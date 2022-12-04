//
//  Extension.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 14/09/22.
//

import Foundation
import UIKit

//  MARK: - UIViewController
extension UIViewController{
    func setStatusBar(){
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
extension UICollectionViewLayout{
    
    func createLayoutPortrait() -> UICollectionViewCompositionalLayout{
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
    func addSubviews(_ subviews: UIView...){
        subviews.forEach(addSubview)
    }
}

extension UIStackView{
    
    func addArregendSubViews(_ subviews: UIView...){
        subviews.forEach(addArrangedSubview)
    }
}

extension UIColor {
    static var blueTest = UIColor(red: 24/255, green: 20/255, blue: 36/255, alpha: 1)
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
