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
    func fetchMoonsData(moon endPoint: URL?) async throws -> Body
}

class SolarSystemRepository: SolarSystemRepositoryProtocol {

    private var apiClient: APIClienteProtocol
    private(set) var url: URL? = URL(string: "https://api.le-systeme-solaire.net/rest/bodies")
    
    
    init(apiClient: APIClienteProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }

    internal func fetchSolarSystemData() async throws -> SolarSystem {
        guard let url = url else {
            throw APIError.invalidEndpoint
        }
        
        return try await apiClient.requestData(url: url, params: nil)
    }
    
    internal func fetchPlanetData(planet name: String) async throws -> Body {
        guard let url = url, let finalURL = URL(string: url.absoluteString  + "/" + name) else {
            throw APIError.invalidEndpoint
        }
        
        return try await apiClient.requestData(url: finalURL, params: nil)
    }

    internal func fetchMoonsData(moon endPoint: URL?) async throws -> Body {
        guard let url = endPoint else {
            throw APIError.invalidEndpoint
        }
        return try await apiClient.requestData(url: url, params: nil)
    }
}

