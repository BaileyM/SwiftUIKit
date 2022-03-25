//
//  GesturesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct GesturesScreen: View {
 
    var body: some View {
        List {
            Section {
                ListText("SwiftUIKit has additional gestures for SwiftUI.")
            }
            
            Section(header: Text("Gestures")) {
                ListNavigationLink(destination: SwipeGestureScreen()) {
                    Label("Swipe Gesture", image: .swipeGesture)
                }
            }
        }.navigationTitle("Gestures")
    }
}

struct GesturesScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        GesturesScreen()
    }
}
