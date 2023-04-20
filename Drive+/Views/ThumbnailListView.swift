//
//  ThumbnailListView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/19/23.
//

import SwiftUI

struct ThumbnailListView: View {
    var folder_metadata: FileMetadata
    @ObservedObject var folder: Folder = Folder()
    
    var body: some View {
        VStack{
            ZStack {
                    Color.gray
                        .frame(width: UIScreen.main.bounds.width, height: 150*CGFloat(folder.content.count), alignment: .top)
                        .opacity(0.1)
                        .cornerRadius(10)
                    NavigationView {
                        List(folder.content) { file_metadata in
                            NavigationLink(destination: FileView(file_metadata: file_metadata)) {
                                ThumbnailView(file_metadata: file_metadata)
                            }
                        }
                    }
            }.task{
                await folder.getData(metadata: folder_metadata)
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
