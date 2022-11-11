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
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: item,
            count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

//  MARK: - UITextField
let passwordTottleButton = UIButton(type: .custom)

extension UITextField {
    internal func addBottomBorder(height: CGFloat = 1.0, color: UIColor = .darkGray) {
        let borderView = UIView()
        borderView.backgroundColor = color
        borderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(borderView)
        NSLayoutConstraint.activate(
            [
                borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                borderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
                borderView.heightAnchor.constraint(equalToConstant: height),
            ]
        )
    }
    
    
    func enablePasswordToggle(){
        passwordTottleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordTottleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordTottleButton.tintColor = .systemBackground
        passwordTottleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordTottleButton
        rightViewMode = .always
    }
    
    @objc
    func togglePasswordView(_ sender: Any){
        isSecureTextEntry.toggle()
        passwordTottleButton.isSelected.toggle()
    }
}

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

