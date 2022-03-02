//
//  SettingsView.swift
//  FriendlyWalk
//
//  Created by Ali Ahmed Khan on 2/27/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct Settings: View {
    @State private var shareData = false
    @AppStorage("visualizeDetections") var visualizeDetections = true
    @AppStorage("showLabels") var showLabels = true
    @AppStorage("metricUnits") var metricUnits = false
    @AppStorage("showSpeed") var showSpeed = true
    @AppStorage("iouThreshold") var iouThreshold = 0.6
    @AppStorage("confidenceThreshold") var confidenceThreshold = 0.45
    var body: some View {
        VStack {
            List {
                Text("Basic settings")
                    .font(.title)
                    .padding(0.5)
            }
            Spacer()
            
        }
        .navigationBarTitle("Settings")
    }
        
        
    
}

struct Settings_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        if #available(iOS 14.0, *) {
            Settings()
        } else {
            // Fallback on earlier versions
        }
    }
}
