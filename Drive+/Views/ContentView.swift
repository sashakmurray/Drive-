//
//  ContentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var files: [File] = [Document(), Folder(data: [Document(), Document()]), Document()]
    
    var body: some View {
        ScrollView {
            ForEach($files) { file in
                FileListView(file: file)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
