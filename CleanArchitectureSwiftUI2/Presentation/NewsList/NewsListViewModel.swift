//
//  NewsListViewModel.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import Foundation
import Resolver

class NewsListViewModel :ObservableObject {
    @Published private(set) var state: NewsViewModelState = .idle
    
    @Published var news : [News] = []
    
   
    @Injected var newsListUseCase : GetAllNewsUseCaseProtocol
    
    @MainActor
    func getNews() async{
        print("get news")
        self.state = .loading
        let result = await newsListUseCase.execute(page: 1, pageSize: 10)
        switch result{
        case .success(let news):
            print("success")
            self.news = news
            self.state = .loaded
        case .failure(let error):
            self.state = .failed(error)
            print(error.localizedDescription)
        }
    }
}
