//
//  View+Extensions.swift
//  CleanArchitectureSwiftUI2
//
//  Created by Nyi Ye Han on 20/06/2022.
//

import Foundation
import SwiftUI

extension View{
    func eraseToAnyView() -> AnyView { AnyView(self) }
}
