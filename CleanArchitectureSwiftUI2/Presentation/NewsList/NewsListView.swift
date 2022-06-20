//
//  NewsListView.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject var vm = NewsListViewModel()
    
    var body: some View {
        content
            .task {
                await vm.getNews()
            }
    }
    
    
    
    fileprivate func errorMessageView(message : String) -> some View{
        Text(message)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    fileprivate func renderList(news : [News]) -> some View{
        List(news){ new in
            Text(new.title)
        }
        
        
    }
    
    private var content : some View{
        switch vm.state {
            
        case .loading:
            return ProgressView("Loading Assets...").eraseToAnyView()
            
        case .failed(let error) :
            return errorMessageView(message: error.description).eraseToAnyView()
            
        case .idle :
            return Color.accentColor.ignoresSafeArea().eraseToAnyView()
            
            
        case .loaded:
            return renderList(news: vm.news).eraseToAnyView()
        }
    }
    
}


struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
