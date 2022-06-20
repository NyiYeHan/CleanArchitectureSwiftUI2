//
//  GetAllNewsUseCase.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import Foundation
import Resolver

protocol GetAllNewsUseCaseProtocol {
    func execute(page : Int ,pageSize : Int) async -> Result<[News],AppError>
}

struct GetAllNewsUseCase : GetAllNewsUseCaseProtocol{
   @Injected var repo : NewsRepositoryProtocol
    func execute(page : Int ,pageSize : Int) async -> Result<[News], AppError> {
        
        let parameters :[String : String] = [
            EndPoint.API_KEY : EndPoint.API_VALUE,
            EndPoint.LANGUAGE : EndPoint.LANGUAGE_EN,
            EndPoint.CATEGORY : "general",
            EndPoint.PAGE : "\(page)",
            EndPoint.PAGE_SIZE : "\(pageSize)"
        ]
        
        do {
           let news =  try await repo.getNews(parameters: parameters)
            return .success(news)
        } catch let error {
            switch error {
            case is AppError:
                print("\((error as! AppError).description)")
                return .failure(error as! AppError )
            default:
                return .failure(.network(description: error.localizedDescription))
            }
            
        }
    }
    
    
}
