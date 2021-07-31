//
//  FlippableView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view has a front and a back view and can be flipped to
 show the other side when it's tapped, swiped or both.
 
 For now, it only supports horizontal flip, since flipping a
 view both horizontally and vertically can mess it up and is
 not good from a usability point of view, since the view can
 become upside down.
 */
public struct FlipView<FrontView: View, BackView: View>: View {
    
    public init(
        front: FrontView,
        back: BackView,
        flipDuration: Double = 0.3,
        tapDirection: FlipDirection = .right,
        swipeDirections: [FlipDirection] = [.left, .right, .up, .down]) {
        self.front = front
        self.back = back
        self.flipDuration = flipDuration
        self.tapDirection = tapDirection
        self.swipeDirections = swipeDirections
    }
    
    private let front: FrontView
    private let back: BackView
    private let flipDuration: Double
    private let swipeDirections: [FlipDirection]
    private let tapDirection: FlipDirection
    
    @State private var cardRotation = 0.0
    @State private var contentRotation = 0.0
    @State private var isFlipped = false
    
    public var body: some View {
        content
            .onTapGesture { flip(tapDirection) }
            .onSwipeGesture(
                up: { swipe(.up) },
                left: { swipe(.left) },
                right: { swipe(.right) },
                down: { swipe(.down) })
            .rotationEffect(.degrees(contentRotation), direction: tapDirection)
            .rotationEffect(.degrees(cardRotation), direction: tapDirection)
    }
}

public enum FlipDirection {
    
    case left, right, up, down
}

private extension FlipView {
    
    var content: some View {
        ZStack {
            if isFlipped {
                back
            } else {
                front
            }
        }
    }

    var cardAnimation: Animation {
        Animation.linear(duration: flipDuration)
    }
    
    var contentAnimation: Animation {
        Animation.linear(duration: 0.001).delay(flipDuration/2)
    }
    
    func flip(_ direction: FlipDirection) {
        let degrees = flipDegrees(for: direction)
        withAnimation(cardAnimation) {
            cardRotation += degrees
        }
        withAnimation(contentAnimation) {
            contentRotation += degrees
            isFlipped.toggle()
        }
    }
    
    func flipDegrees(for direction: FlipDirection) -> Double {
        switch direction {
        case .right, .up: return 180
        case .left, .down: return -180
        }
    }
    
    func swipe(_ direction: FlipDirection) {
        guard swipeDirections.contains(direction) else { return }
        flip(direction)
    }
}

private extension View {
    
    @ViewBuilder
    func rotationEffect(_ angles: Angle, direction: FlipDirection) -> some View {
        switch direction {
        case .left, .right: self.rotation3DEffect(angles, axis: (x: 0, y: 1, z: 0))
        case .up, .down: self.rotation3DEffect(angles, axis: (x: 1, y: 0, z: 0))
        }
    }
}


struct FlippableView_Previews: PreviewProvider {
    
    static var front: some View {
        Color.green
    }
    
    static var back: some View {
        Color.red
    }
    
    static var previews: some View {
        FlipView(
            front: front,
            back: back,
            flipDuration: 0.5,
            tapDirection: .right,
            swipeDirections: [.left, .right])
    }
}
#endif
