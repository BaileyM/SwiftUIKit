//
//  Text+Markdown.swift
//  Text+Markdown
//
//  Created by Daniel Saidi on 2021-09-05.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

@available(iOS 15, tvOS 15, watchOS 8, *)
@available(*, deprecated, message: "Just use the default initializer.")
public extension Text {
    
    /**
     Create a text view with markdown.
     */
    init(markdown: String) {
        let options = AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        let str = try? AttributedString(markdown: markdown, options: options)
        self.init(str ?? "Invalid markdown")
    }
}
#endif
