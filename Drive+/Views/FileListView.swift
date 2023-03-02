//
//  FileListView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/2/23.
//

import SwiftUI

struct FileListView: View {
    
    @Binding var file: File
    var formatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "yyyy/MM/dd HH:mm"
        return f
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(file.name)
                        .font(Fonts.medium)
                        .padding()
                    
                    Spacer()
                    
                    Text("Modified \(formatter.string(from: file.last_modified))")
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
