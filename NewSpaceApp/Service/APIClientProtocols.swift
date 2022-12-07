//
//  APIClientProtocols.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation


protocol PlanetsProtocol{
    func fetchSolarSystemData(completion: @escaping (Result<SolarSystem, APIError>) -> Void)
    func fetchPlanetData(planet name: String, completion: @escaping (Result<Planet, APIError>) -> Void)
}
