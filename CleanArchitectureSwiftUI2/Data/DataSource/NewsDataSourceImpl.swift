//
//  NewDataSource.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//
import Foundation
import Resolver

struct NewsDataSourceImpl : NewsDataSourceProtocol{
    @Injected var urlComponentsService : URLComponentsService
    
    func getNews(parameters: [String : String]) async throws -> [News] {
        guard let url = urlComponentsService.makeComponent(queryParameters: parameters,path: EndPoint.GET_NEWS).url else{
            throw AppError.badURL(description: String(localized: "INVALID_URL"))
            
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else{
            throw AppError.network(description: String(localized: "Something went wrong! Please try again later."))
        }
        
        if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
            throw AppError.network(description: String(localized: "\(response.statusCode) \(HTTPURLResponse.localizedString(forStatusCode:response.statusCode))"))
        }
        
        
        do{
            let result = try data.decoded() as NewListResponse
            return  result.articles.map { new in
                News(new: new)
            }
        }catch let error{
            debugPrint(error)
            throw AppError.parsing(description: String(localized: "INVALID_DATA_PARSING"))
        }
    }
    
}
