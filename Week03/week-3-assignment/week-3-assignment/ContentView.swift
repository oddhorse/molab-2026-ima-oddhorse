//
//  AnimView.swift
//  week-3-assignment
//
//  Created by john on 9/24/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AnimViewColor()
                .tabItem {
                    Label("color", systemImage: "tree.fill").symbolRenderingMode(.palette)
                }
            AnimViewBW()
                .tabItem {
                    Label("b+w", systemImage: "tree.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
