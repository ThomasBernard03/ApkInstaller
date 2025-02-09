//
//  MainView.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 09/02/2025.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("installCount") private var installCount: Int = 0
    
    var body: some View {
        VStack {
            Text(String(installCount))
                .font(.largeTitle)
            Text("Installed applications")
        }
        
    }
}

//#Preview {
//    MainView()
//}
