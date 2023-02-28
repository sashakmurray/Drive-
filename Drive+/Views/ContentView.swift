//
//  ContentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    
    var f: Folder = Folder()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        Text(f.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
