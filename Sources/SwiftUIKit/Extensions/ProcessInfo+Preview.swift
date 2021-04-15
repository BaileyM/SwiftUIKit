//
//  ProcessInfo+Preview.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-13.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

public extension ProcessInfo {
    
    /**
     Whether or not the process is running a SwiftUI preview.
     
     You can check this in your SwiftUI previews, using this
     piece of code:
     
     ```
     if ProcessInfo.processInfo.isSwiftUIPreview { ... }
     ```
     */
    var isSwiftUIPreview: Bool {
        environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
