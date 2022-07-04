//
//  NewDataSource.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//
import Foundation
import Resolver
import Alamofire

struct NewsDataSourceImpl : NewsDataSourceProtocol{
    
//    @Injected var urlSessionService : URLSessionService
    @Injected var alamofireService : AlamofireService
    
    func getNews (parameters: [String : String]) async throws -> [News]{
        
        
        let api = APIRequest<NewListResponse>(urlString: EndPoint.GET_NEWS , parameters : parameters)
        
//        let container = try await urlSessionService.urlSessionRequest(api, parameters)
        let container = try await alamofireService.alamofireRequest(api, parameters)
        return container.articles.map { new in
            News(new: new)
        }
    }
}


struct APIRequest<T: Decodable> {
  var urlString: String
  var parameters : [String:String]
    let decodeJSON: (Data) throws -> T
}

extension APIRequest {
    init(urlString: String,parameters : [String :String]) {
    self.urlString = urlString
    self.parameters = parameters
    self.decodeJSON = { data in
      return try JSONDecoder().decode(T.self, from: data)
    }
  }
    
    
}
