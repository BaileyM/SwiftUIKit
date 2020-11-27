//
//  ViewsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ViewsScreen: View {
    
    var body: some View {
        DemoList("Views") {
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit contains a large collection of additional views for SwiftUI.")
            }
            
            Section(header: Text("Views")) {
                list1
                list2
            }
        }
    }
    
    private var list1: some View {
        Group {
            DemoListLink("Async Image", .photo, AsyncImageScreen())
            DemoListLink("Circular Progress Bar", .circularProgressBar, CircularProgressBarScreen())
            DemoListLink("Circular Progress View", .circularProgressView, CircularProgressViewScreen())
            DemoListLink("Collection View (grid)", .collectionViewGrid, CollectionViewGridScreen())
            DemoListLink("Collection View (shelves)", .collectionViewShelves, CollectionViewShelvesScreen())
            DemoListLink("Conditional View", .conditional, ConditionalViewScreen())
            DemoListLink("Dismissable View", .dismiss, DismissableViewScreen())
            DemoListLink("Fetched Data View", .download, FetchedDataViewScreen())
            DemoListLink("Flippable View", .swipeGesture, FlippableViewScreen())
            DemoListLink("Multiline Text Field", .multiline, MultilineTextFieldScreen())
        }
    }
    
    private var list2: some View {
        Group {
            DemoListLink("Optional View", .optional, OptionalViewScreen())
            DemoListLink("Page View", .pageControl, PageViewScreen())
            DemoListLink("UIView Wrapper", .wrapper, UIViewWrapperScreen())
        }
    }
}

struct ViewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewsScreen()
        }
    }
}
