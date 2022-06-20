//
//  ArticleEntity.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import Foundation

struct NewsEntity  : BaseEntity{
    var id: String { title }
    let title : String
    let description : String
}
