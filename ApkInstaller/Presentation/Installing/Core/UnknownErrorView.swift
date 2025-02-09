//
//  UnknownErrorView.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 09/02/2025.
//

import SwiftUI

struct UnknownErrorView: View {
    
    let message : String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "xmark.octagon")
                .symbolEffect(.pulse)
                .font(.largeTitle)
                .foregroundStyle(.red)
            VStack(alignment:.leading) {
                Text("Installation failed")
                    .font(.title2)
                Text(message)
            }
            
            Spacer()
        }
    }
}

#Preview {
    UnknownErrorView(
        message: "Unknown error"
    )
}
