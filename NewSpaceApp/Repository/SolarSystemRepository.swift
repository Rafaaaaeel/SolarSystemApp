//
//  PlanetsRepository.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 11/11/22.
//

import Foundation

protocol SolarSystemRepositoryProtocol {
    func fetchSolarSystemData(completion: @escaping (Result<SolarSystem, Error>) -> Void?)
    func fetchPlanetData(planet name: String, completion: @escaping (Result<Body, Error>) -> Void?)
}

class SolarSystemRepository: SolarSystemRepositoryProtocol {

    private var apiClient: APIClient
    
    init(apiClient: APIClient = APIClient.shared) {
        self.apiClient = apiClient
    }

    func fetchSolarSystemData(completion: @escaping (Result<SolarSystem, Error>) -> Void?) {
        apiClient.fetchSolarSystemData{ result in
            switch result {
            case .success(let solarSystem):
                completion(.success(solarSystem))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchPlanetData(planet name: String, completion: @escaping (Result<Body, Error>) -> Void?) {
        apiClient.fetchPlanetData(planet: name) { result in
            switch result {
            case .success(let planet):
                completion(.success(planet))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
