//
//  App+Injection.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 18/06/2022.
//

import Foundation
import Resolver

extension Resolver : ResolverRegistering{
    public static func registerAllServices() {
        
        defaultScope = .application
        
        register{URLComponentsService() }
        register{NewsDataSourceImpl()}.implements(NewsDataSourceProtocol.self)
        register{NewsRepositoryImpl()}.implements(NewsRepositoryProtocol.self)
        register{GetAllNewsUseCase()}
        
    }
}

