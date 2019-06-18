//
//  ContentView.swift
//  EmotionalDiary
//
//  Created by Italo Boss on 11/06/19.
//  Copyright © 2019 Italo Boss. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var selection = 0
    
    var body: some View {
        TabbedView(selection: $selection) {
            NavigationView {
                List {
                    Text("Test 1")
                    Text("Test 2")
                    Text("Test 3")
                    }
                    .navigationBarTitle(Text("Title"))
            }
            .tabItemLabel(Text("Resume"))
            .tag(0)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
