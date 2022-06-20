//
//  NewsModel.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import Foundation

struct News : BaseModel{
    var new : NewsEntity
    
    var id: String { new.id }
    var title : String {new.title}
    var description : String {new.description}
}
