//
//  URLComponentsService.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 17/06/2022.
//

import Foundation

// MARK: - URLComponentsService
struct URLComponentsService {
    func makeComponent(queryParameters :[String : String]? = nil,path : String? = nil) -> URLComponents {
        var components = URLComponents()
        components.host = EndPoint.BASE_URL
        components.scheme = EndPoint.SCHEME
        if let path = path {
            components.path = path
        }
        if let parameters = queryParameters {
            var items : [URLQueryItem] = []
            for (key,value) in parameters {
                items.append(URLQueryItem(name: key, value: value))
            }
            components.queryItems = items
        }
        return components
    }
}
