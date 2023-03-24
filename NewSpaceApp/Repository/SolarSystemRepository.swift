//
//  PlanetsRepository.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 11/11/22.
//
typealias SolarSystemReturn = (Result<SolarSystem, Error>) -> Void?
import Foundation

protocol SolarSystemRepositoryProtocol {
    func fetchSolarSystemData() async throws -> SolarSystem
    func fetchPlanetData(planet name: String) async throws -> Body
}

class SolarSystemRepository: SolarSystemRepositoryProtocol {

    private var apiClient: APIClienteProtocol
    private(set) var endPoint = "/bodies"
    
    
    init(apiClient: APIClienteProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }

//    func fetchPlanetData(planet name: String, completion: @escaping (Result<Body, Error>) -> Void?) {
//        apiClient.fetchPlanetData(planet: name) { result in
//            switch result {
//            case .success(let planet):
//                completion(.success(planet))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
    
    internal func fetchPlanetData(planet name: String) async throws -> Body {
        return try await apiClient.requestData(endpoint: endPoint + "/" + name, params: nil)
    }
    
    internal func fetchSolarSystemData() async throws -> SolarSystem {
        return try await apiClient.requestData(endpoint: endPoint, params: nil)
    }
    
}

