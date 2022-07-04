//
//  URLSessionService.swift
//  CleanArchitectureSwiftUI2
//
//  Created by Nyi Ye Han on 04/07/2022.
//

import Foundation
import Alamofire
import Resolver

class URLSessionService {
    
    @Injected var urlComponentsService : URLComponentsService
    
    func urlSessionRequest<T>(_ apiRequest: APIRequest<T>,
                    _ parameters : [String : String],
                    method : HTTPMethod? = .get,
                    headers : HTTPHeaders? = nil
    )async throws -> T {
        print("Making url session request \(apiRequest.urlString)")
        
        guard let url = urlComponentsService.makeComponent(queryParameters: parameters,path: EndPoint.GET_NEWS).url else{
            throw AppError.badURL(description: String(localized: "INVALID_URL"))
        }
       print(url)
        let request = URLRequest(url: url)
        
        let data = try await URLSession.shared.data(for: request, delegate: nil).0
        return try apiRequest.decodeJSON(data)
        
    }
}
