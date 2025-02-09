//
//  SucessVie.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 09/02/2025.
//

import SwiftUI

struct SuccessView: View {
    @AppStorage("installCount") private var installCount: Int = 0
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .symbolEffect(.breathe)
                .font(.largeTitle)
                .foregroundStyle(.green)
            VStack(alignment:.leading) {
                Text("Application installed")
                    .font(.title2)
                Text("Installed applications : \(installCount)")
            }
            
            Spacer()
        }
        .onAppear {
            installCount += 1
        }
    }
}

