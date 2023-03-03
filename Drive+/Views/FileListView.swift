//
//  FileListView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/2/23.
//

import SwiftUI

struct FileListView: View {
    
    @Binding var file: File
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(file.name)
                        .font(Fonts.medium)
                        .padding()
                    
                    Spacer()
                    
                    Text("Modified \(file.last_modified.formatted(date: .abbreviated, time: .shortened))")
                        .font(Fonts.small)
                        .padding([.leading, .trailing, .bottom])
                }
                
                Spacer()
            }
        }
    }
}

struct FileListView_Previews: PreviewProvider {
    static var previews: some View {
        FileListView(file: Binding.constant(File()))
    }
}
