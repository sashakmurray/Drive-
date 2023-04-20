//
//  ThumbnailListView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/19/23.
//

import SwiftUI

struct ThumbnailListView: View {
    @State var folder: Folder = Folder(drive_id: "root")
    
    var body: some View {
        ZStack {
            Color.gray
                .frame(width: UIScreen.main.bounds.width, height: 150*CGFloat(folder.content.count), alignment: .top)
                .opacity(0.1)
                .cornerRadius(10)
                NavigationView {
                    List($folder.content) { $file in
                        NavigationLink(destination: FileView(file: $file)) {
                            ThumbnailView(file: $file)
                        }
                    }
                }
        }
    }
}

//
//struct ThumbnailListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThumbnailListView(folder: Binding.constant([File()]))
//    }
//}
