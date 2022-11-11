//
//  PlanetsRepository.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 11/11/22.
//

import Foundation

protocol PlanetsRepositoryProtocol {
    func fetchPlanetsData(completion: @escaping (Result<SolarSystem, Error>) -> Void?)
}

class PlanetsRepository: PlanetsRepositoryProtocol {

    private var apiClient: APIClient
    
    init(apiClient: APIClient = APIClient.shared) {
        self.apiClient = apiClient
    }

    func fetchPlanetsData(completion: @escaping (Result<SolarSystem, Error>) -> Void?) {
        apiClient.fetchPlanetsData{ result in
            switch result {
            case .success(let solarSystem):
                completion(.success(solarSystem))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
