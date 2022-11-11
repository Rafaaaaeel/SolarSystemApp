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
    
    func fetchPlanetsData(completion: @escaping (Result<SolarSystem, APIError>) -> Void) {
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
    
}
