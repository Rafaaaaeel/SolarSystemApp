//
//  APIClient.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation

class APIClient: PlanetsProtocol{

    static let shared = APIClient()
    private init() {}
    
    private let baseAPIURL = "https://api.le-systeme-solaire.net/rest/bodies/"
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
    
    func fetchSolarSystemData(completion: @escaping (Result<SolarSystem, APIError>) -> Void) {
        guard let url = URL(string: baseAPIURL) else {
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
            
            if let responseData = try? self.jsonDecoder.decode(SolarSystem.self, from: data){
                completion(.success(responseData))
            } else {
                completion(.failure(.serializationError))
            }

        }
        task.resume()
    
    }
    
    
    private func loadURLAndDecode<D: Decodable>(url: URL, params: [String: String]? = nil, completion: @escaping (Result<D, APIError>) -> ()) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: nil)]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: finalURL) { (data, response, error) in
            if error != nil {
                self.executeCompletionHandlerInMainThread(with: .failure(.apiError), completion: completion)
            }
            
            
        }
    }
    
    private func executeCompletionHandlerInMainThread<D:Decodable>(with result: Result<D, APIError>, completion: @escaping (Result<D, APIError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
    
}
