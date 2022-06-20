//
//  NewsRepository.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import Foundation
import Resolver

struct NewsRepositoryImpl : NewsRepositoryProtocol {
    @Injected var dataSource : NewsDataSourceProtocol
    
    func getNews(parameters: [String : String]) async throws -> [News] {
        let _news = try await dataSource.getNews(parameters: parameters)
        return _news
    }
    
    //
    func deleteNew(new: News) {

    }


}
