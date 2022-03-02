//
//  NavigationView.swift
//  FriendlyWalk
//
//  Created by Ali Ahmed Khan on 2/27/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI


@available(iOS 14.0, *)
struct NavigationView: View {
    @State private var isHidden: Bool = false

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                    NavigationLink(destination: Settings()) {
                    VStack {
                        Text("Settings")
                       
                        }
                        
                    }
                    
                }
            .opacity(isHidden ? 0: 1)
        }
        .contentShape(Rectangle()) // Makes full screen tapable
        .navigationBarHidden(true)
        .gesture(TapGesture()
                    .onEnded{isHidden.toggle()} )
    }
}
    

@available(iOS 14.0, *)
struct NaigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
