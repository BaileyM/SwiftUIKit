//
//  ShadowStyleScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ShadowStyleScreen: View {
    var body: some View {
        DemoList("Corner Radius Style") {
            item(.red, style: .small)
            item(.green, style: .medium)
            item(.blue, style: .large)
        }
    }
}

private extension ShadowStyleScreen {
    
    func item(_ color: Color, style: DemoStyle) -> some View {
        color
            .frame(height: 150)
            .shadow(style.style)
            .overlay(Text(style.text))
            .padding()
    }
}

private enum DemoStyle: String {
    
    case small, medium, large
    
    var style: ShadowStyle {
        ShadowStyle(color: .black, radius: radius, x: 1, y: 1)
    }
    
    var radius: CGFloat {
        switch self {
        case .small: return 2
        case .medium: return 5
        case .large: return 10
        }
    }
    
    var text: String {
        "\(rawValue.capitalized) shadow"
    }
}

struct ShadowStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShadowStyleScreen()
    }
}
