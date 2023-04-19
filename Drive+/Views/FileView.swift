//
//  FileView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/19/23.
//

import SwiftUI

struct FileView: View {
    @Binding var file: File
    
    var body: some View {
        if(file.mime_type == "application/vnd.google-apps.document"){
            DocumentView(file: $file)
        }
    }
}
    
//
//struct FileView_Previews: PreviewProvider {
//    static var previews: some View {
//        FileView()
//    }
//}
