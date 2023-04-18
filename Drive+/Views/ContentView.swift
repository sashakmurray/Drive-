//
//  ContentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var file: Document = Document()
    @State var fileFetcher = FileFetcher()
    
    var body: some View {
        DocumentView(file: $file, data: $fileFetcher)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
