//
//  NewListResponse.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import Foundation

struct NewListResponse : BaseEntity{
    var status: String
    var totalResults: Int
    var articles : [NewsEntity]
}
