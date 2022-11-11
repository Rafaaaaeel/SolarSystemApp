//
//  APIReponseModel.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation

struct SolarSystem: Codable{
    
    let bodies: [Planets]
    
}

struct Planets: Codable{
    
    let id: String
    let name: String
    let englishName: String
    let isPlanet: Bool
    let moons: [Moons]?
    
}

struct Moons: Codable{
    
    let moon: String
    
}
