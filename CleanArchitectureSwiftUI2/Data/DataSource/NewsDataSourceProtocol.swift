//
//  NewDataSourceProtocol.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import Foundation
// feed
protocol NewsDataSourceProtocol{
    func getNews(parameters : [String : String])async throws -> [News]
}
