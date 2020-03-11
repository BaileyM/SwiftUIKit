//
//  ShadowStyleScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ShadowStyleScreen: View, DemoList {
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                cell(title: ".discrete", color: .red, style: .discrete)
                cell(title: ".thinBlue", color: .green, style: .thinBlue)
                cell(title: ".crazyRed", color: .blue, style: .crazyRed)
            }
        }.navigationBarTitle("ShadowStyle")
    }
}

private extension ShadowStyleScreen {
    
    func cell(title: String, color: Color, style: ShadowStyle) -> some View {
        DemoListCell(title: title, content: color, effect: { $0.shadow(style) })
    }
}

private extension ShadowStyle {
    
    static var crazyRed: ShadowStyle {
        ShadowStyle(color: .red, radius: 20, x: -5, y: 10)
    }
    
    static var discrete: ShadowStyle {
        .standardToast
    }
    
    static var thinBlue: ShadowStyle {
        ShadowStyle(color: .blue, radius: 2, x: 0, y: 0)
    }
}

struct ShadowStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShadowStyleScreen()
    }
}
