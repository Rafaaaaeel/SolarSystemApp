//
//  APIClient.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation

final class APIClient: APIClienteProtocol {

    static let shared = APIClient()
    private init() {}
    
    private let baseAPIURL = "https://api.le-systeme-solaire.net/rest/"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder
    
    func fetchPlanetData(planet name: String, completion: @escaping (Result<Body, APIError>) -> Void) {
        guard let url = URL(string: "\(baseAPIURL)\(name)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            if let responseData = try? self.jsonDecoder.decode(Body.self, from: data){
                completion(.success(responseData))
            } else {
                completion(.failure(.serializationError))
            }

        }
        task.resume()
    }

    internal func requestData<D: Decodable>(endpoint: String, params: [String: String]? = nil) async throws -> D {

        guard let url = URL(string: baseAPIURL + endpoint), var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw APIError.invalidEndpoint
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: nil)]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else {
            throw APIError.invalidEndpoint
        }
        
        let (data, response) = try await urlSession.data(from: finalURL)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw APIError.invalidResponse
        }
        
        return try self.jsonDecoder.decode(D.self, from: data)
    }
    
}
