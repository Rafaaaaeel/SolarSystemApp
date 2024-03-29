//
//  APIClientProtocols.swift
//  NewSpaceApp
//
//  Created by Rafael Oliveira on 29/09/22.
//

import Foundation


protocol APIClienteProtocol{
    func requestData<D: Decodable>(url: URL, params: [String: String]?) async throws -> D
}
