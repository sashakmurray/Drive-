//
//  FileView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/19/23.
//

import SwiftUI

struct FileView: View {
    var file_metadata: FileMetadata
    
    var body: some View {
        if(file_metadata.mimeType == "application/vnd.google-apps.document"){
            DocumentView(document_metadata: file_metadata)
        }else if(file_metadata.mimeType == "application/vnd.google-apps.folder"){
            ThumbnailListView(folder_metadata: file_metadata)
        }else{
            Text("No file type support")
        }
    }
}
    
//
//struct FileView_Previews: PreviewProvider {
//    static var previews: some View {
//        FileView()
//    }
//}
