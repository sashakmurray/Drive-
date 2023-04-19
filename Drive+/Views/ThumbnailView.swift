//
//  ThumbnailView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/19/23.
//

import SwiftUI

struct ThumbnailView: View {
    @Binding var file: File
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
        }
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailView(file: Binding.constant(File()))
    }
}
