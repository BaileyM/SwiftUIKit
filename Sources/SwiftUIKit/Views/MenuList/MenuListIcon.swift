//
//  MenuListItemIcon.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-01.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view is used by `MenuListItem` as the leading icon. It
 presses the icon down to a certain size.
 */
public struct MenuListIcon<Icon: View>: View {
    
    /**
     Create an icon with a custom image or view.
     */
    public init(_ icon: Icon) {
        self.icon = icon
    }
    
    private let icon: Icon
    
    public var body: some View {
        icon.frame(width: 20)
    }
}

public extension MenuListIcon where Icon == Text {
    
    /**
     Create an icon with an emoji character.
     */
    init(_ emoji: String) {
        self.init(Text(emoji))
    }
}

struct MenuListItemIcon_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuListIcon(Image(systemName: "plus"))
    }
}
