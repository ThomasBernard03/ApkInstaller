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
            switch(viewModel.status){
                
            case .notStarted:
                EmptyView()
            case .installing:
                ProgressView("Installing \(viewModel.applicationName)")
                    .progressViewStyle(.linear)
            case .installed:
                SuccessView()
            case .unknownError:
                VStack(alignment: .trailing) {
                    Text(viewModel.message)
                    Spacer()
                
                }
            case .noDeviceConnected:
                NoDeviceConnectedView()
            }
            
            Spacer()
            if(viewModel.status != .installing){

                Button(
                    action: {
                        NSApplication.shared.windows.last?.close()
                        NSApplication.shared.terminate(nil)
                    },
                    label: {
                        Spacer()
                        Text("Close")
                        Spacer()
                    }
                )
            }


        }
//        .frame(width: 200, height: 80)
        .frame(minWidth: 200, minHeight: 80)
        .padding()
        .onAppear {
            Task {
                await viewModel.installApk(path: path)
            }
        }
    }
}

//#Preview {
//    InstallingView(path: URL(filePath:"Desktop/myapp.apk")!)
//}
