//
//  CodableView.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 10/09/22.
//

import Foundation


public protocol CodableViews{
    func setup()
    func setupHierachy()
    func setupConstraints()
    func additional()
}

extension CodableViews{
    func setup(){
        setupHierachy()
        setupConstraints()
        additional()
    }
    
    func additional() { }
}
