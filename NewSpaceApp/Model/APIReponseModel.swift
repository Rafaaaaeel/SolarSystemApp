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

enum SolarSystemPlanets: String {
    case mercury = "Mercury"
    case venus = "Venus"
    case earth = "Earth"
    case mars = "Mars"
    case juptier = "Jupiter"
    case saturn = "Saturn"
    case uranus = "Uranus"
    case netptune = "Neptune"
}
