//
//  APIClientProtocols.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation


protocol PlanetsProtocol{
    func fetchPlanetsData(completion: @escaping (Result<SolarSystem, APIError>) -> Void)
}
