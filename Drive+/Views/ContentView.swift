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
    @State var string = NSMutableAttributedString(string: "hello")
    
    var body: some View {
        DocumentView(file: $file)
//        TextView(text: $string)
//
//        Button {
//            string.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:2))
//            string.append(NSAttributedString(string: "heiiiii"))
//            print(string)
//        } label: {
//            Text("click me")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
