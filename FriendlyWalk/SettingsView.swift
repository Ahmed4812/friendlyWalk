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
    var buttonHeight = UIScreen.main.bounds.size.height/2.75
    var buttonWidth = UIScreen.main.bounds.size.width/1.25
    @State private var shareData = false
    
    @AppStorage("autoDecide") var autoDecide = true
   
    var body: some View {
        VStack {
            List {
                Text("Decision settings")
                    .font(.title)
                    .padding(0.5).accessibilityHint("A menu to choose type of decision")
   
                Button(action: {
                    print("Auto")
                    autoDecide = true
                    synthSpeak(toSay: "Selected Auto")
                    
                }){Text("Auto")}.frame(width: buttonWidth, height: buttonHeight, alignment: .center).accessibilityHint("Decides and informs you automatically when to cross or wait").accessibility(label: Text("Auto Decide"))
                
                
                
                Button(action: {
                    print("Second tapped")
                    autoDecide = false
                    synthSpeak(toSay: "Selected Manual")
                    
                }){Text("Manual")}.frame(width: buttonWidth, height: buttonHeight, alignment: .center).accessibilityHint("Just tells you the state of the traffic light and you make the decision").accessibility(label: Text("Manually Decide"))
            
   
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
