//
//  APIReponseModel.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation

struct SolarSystem: Codable{
    
    let bodies: [Body]
    
}

struct Body: Codable{
    
    let id: String
    let name: String
    let englishName: String
    let isPlanet: Bool
    var moons: [Moon]?
    
}

struct Moon: Codable{
    
    let moon: String
    let rel: String
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

