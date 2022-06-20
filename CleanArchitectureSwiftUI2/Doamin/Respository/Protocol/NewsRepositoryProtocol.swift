//
//  NewsRepositoryProtocol.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import Foundation
protocol NewsRepositoryProtocol {
    func getNews( parameters : [String : String])  async throws -> [News]
    func deleteNew(new : News)
}

