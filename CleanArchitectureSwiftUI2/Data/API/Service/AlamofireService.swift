//
//  AlamofireService.swift
//  CleanArchitectureSwiftUI2
//
//  Created by Nyi Ye Han on 04/07/2022.
//

import Foundation
import Alamofire
import Resolver

class AlamofireService {
    
    @Injected var urlComponentsService : URLComponentsService
    
    func alamofireRequest<T>(_ apiRequest: APIRequest<T>,
                    _ parameters : [String : String],
                    method : HTTPMethod? = .get,
                    headers : HTTPHeaders? = nil
    )async throws -> T {
        print("Making alamofire request \(apiRequest.urlString)")
        
        guard let url = urlComponentsService.makeComponent(queryParameters: parameters,path: EndPoint.GET_NEWS).url else{
            throw AppError.badURL(description: String(localized: "INVALID_URL"))
        }
        let data = try await afRequest(url: url)
        return try apiRequest.decodeJSON(data)
        
    }
    
    func afRequest(url:URL) async throws -> Data {
        try await withUnsafeThrowingContinuation { continuation in
            AF.request(url, method: .get).validate().responseData { response in
                if let data = response.data {
                    continuation.resume(returning: data)
                    return
                }
                if let err = response.error {
                    continuation.resume(throwing: err)
                    return
                }
                fatalError("should not get here")
            }
        }
    }
}
