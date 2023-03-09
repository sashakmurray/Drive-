//
//  ContentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/22/23.
//

import SwiftUI

struct ContentView: View {
//    @State var files: [File] = [Document(), Folder(content: [Document(), Document()]), Document()]
    @State var file: Document = Document()
    
    var body: some View {
        DocumentView(file: $file)
//        RepresentedMyView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
