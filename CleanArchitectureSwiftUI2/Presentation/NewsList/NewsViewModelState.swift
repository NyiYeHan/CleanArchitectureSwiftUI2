//
//  State.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 18/06/2022.
//


enum NewsViewModelState: Equatable {
    static func == (lhs: NewsViewModelState, rhs: NewsViewModelState) -> Bool {
        return false
    }
    
    case idle
    case loading
    case failed(AppError)
    case loaded
}

