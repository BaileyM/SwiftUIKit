//
//  NavigationContext.swift
//  NavigationContext
//
//  Created by Daniel Saidi on 2023-08-17.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This context can be used to manage the state of a nav stack.
 */
public class NavigationContext<Screen: Hashable>: ObservableObject {

    @Published
    var path = [Screen]()
}

extension NavigationContext {

    /// Pop a certain number of elements off the stack.
    func goBack(_ steps: Int) {
        path.removeLast(steps)
    }

    /// Push a new screen onto the stack.
    func push(_ screen: Screen) {
        path.append(screen)
    }
}
