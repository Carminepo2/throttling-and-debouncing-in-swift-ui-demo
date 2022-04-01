//
//  ContentView.swift
//  throttling-debouncing-test
//
//  Created by Carmine Porricelli on 31/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            ThrottlingTestView()
                .tabItem {
                    Text("Throttling")
                }
            
            DebouncingTestView()
                .tabItem {
                    Text("Debouncing")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
