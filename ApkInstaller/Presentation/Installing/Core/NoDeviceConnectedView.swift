//
//  NoDeviceConnectedView.swift
//  ApkInstaller
//
//  Created by Thomas Bernard on 09/02/2025.
//

import SwiftUI

struct NoDeviceConnectedView: View {
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "exclamationmark.triangle.fill")
                .symbolEffect(.bounce)
                .font(.largeTitle)
                .foregroundStyle(.orange)
            VStack(alignment:.leading) {
                Text("No device connected")
                    .font(.title2)
                Text("Plug a phone to your mac and retry")
            }
        }
    }
}

//#Preview {
//    NoDeviceConnectedView()
//}
