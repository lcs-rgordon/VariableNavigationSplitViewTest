//
//  ContentView.swift
//  VariableNavigationSplitViewTest
//
//  Created by Russell Gordon on 2023-01-28.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedInt: Int? = 1
    @State private var columnVisibility: NavigationSplitViewVisibility = .all

    var sidebarList: some View {
        List(1...10, id: \.self, selection: $selectedInt) { int in
            NavigationLink("Row \(int)", value: int)
        }
        .navigationTitle("Sidebar")
    }

    var contentView: some View {
        Text("Content \(selectedInt ?? 0)")
    }

    var detailView: some View {
        Text("Detail \(selectedInt ?? 0)")
    }

    var body: some View {
        Group {
            // Only rows that are a multiple of 2 will have a two-column layout
            if selectedInt?.isMultiple(of: 2) == true {
                NavigationSplitView(columnVisibility: $columnVisibility) {
                    sidebarList
                } detail: {
                    detailView
                }
            } else {
                NavigationSplitView(columnVisibility: $columnVisibility) {
                    sidebarList
                } content: {
                    contentView
                } detail: {
                    detailView
                }
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
