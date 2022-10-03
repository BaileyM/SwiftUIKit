//
//  ListNavigationButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view wraps a regular SwiftUI `Button` and also appends
 a trailing ``NavigationLinkArrow`` to let the button render
 as a `NavigationLink`.
 */
public struct NavigationButton<Content: View>: View {
    
    public init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.action = action
        self.content = content
    }
    
    private let action: () -> Void
    private let content: () -> Content
    
    public var body: some View {
        Button(action: action) {
            HStack {
                content()
                Spacer()
                NavigationLinkArrow()
            }
        }.buttonStyle(.list)
    }
}

#if os(iOS)
struct NavigationButtonItem_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State var isToggled = false
        
        var body: some View {
            NavigationView {
                List {
                    Text("Is toggled: \(isToggled ? 1 : 0)")
                    NavigationLink("Test") {
                        Text("Test")
                    }
                    NavigationLink("Navigation link", destination: Text("HEJ"))

                NavigationButton(action: { isToggled.toggle() }, content: {
                        Text("Toggle")
                    })
                }
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
#endif
