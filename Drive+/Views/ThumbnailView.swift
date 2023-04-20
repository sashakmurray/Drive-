//
//  ThumbnailView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/19/23.
//

import SwiftUI

struct ThumbnailView: View {
    var file_metadata: FileMetadata
    @ObservedObject var file: File = File()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(file.name)
                    .font(.custom("HelveticaNeue-Thin", size: 25))
                    .padding()
                Text(file.last_modified)
                    .font(.custom("HelveticaNeue-Thin", size: 14))
                    .padding(.leading)
            }
            
            Spacer()
            
            Text(String(file.file_size) + "KB")
                .font(.custom("HelveticaNeue-Thin", size: 14))
                .padding()
            
        }.task {
            await file.getData(metadata: file_metadata)
            print(file.name)
        }
    }
}

//struct ThumbnailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThumbnailView(file: Binding.constant(File()))
//    }
//}
