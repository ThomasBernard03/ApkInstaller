//
//  InstallingView.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 01/02/2025.
//

import Foundation
import SwiftUI

struct InstallingView: View {
    
    let path : URL
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Installing \(viewModel.applicationName)")
            ProgressView()
                .progressViewStyle(.linear)
        }
        .frame(width: 200, height: 80)
        .padding()
        .onAppear {
            Task {
                await viewModel.installApk(path: path)
            }
        }
    }
}

#Preview {
    InstallingView(path: URL(filePath:"Desktop/myapp.apk")!)
}
