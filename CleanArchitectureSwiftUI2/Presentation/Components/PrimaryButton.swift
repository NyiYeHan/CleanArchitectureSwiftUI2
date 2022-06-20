//
//  PrimaryButton.swift
//  CleanArchitecture
//
//  Created by Nyi Ye Han on 16/06/2022.
//

import SwiftUI

struct PrimaryButton: View {
    var onLoadNews : ()->Void
    var body: some View {
        Button(action: onLoadNews) {
            Text("load news")
        }
        
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(onLoadNews: {
            
        })
    }
}
