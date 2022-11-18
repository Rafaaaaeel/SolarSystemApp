//
//  Endpoints.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation



enum APIError: Error, CustomNSError{
    case apiError
    case invalidEndpoint
    case noData
    case invalidResponse
    case serializationError
    
    var localizedDescription: String{
        switch self {
        case .apiError:
            return "Failed to fetch the data"
        case .invalidEndpoint:
            return "Invaid Endpoint"
        case .noData:
            return "No data"
        case .invalidResponse:
            return "Invalid Response"
        case .serializationError:
            return "Failed to decode Data"
        }
    }
    
    var errorUserInfo: [String : Any]{
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
