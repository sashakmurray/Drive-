//
//  FileMenuView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 4/21/23.
//

import SwiftUI

struct FileMenuView: View {
    @ObservedObject var file: File
    
    var body: some View {
        HStack {
//            Button {
//            } label: {
//                Image(systemName: "arrow.left.circle.fill")
//                    .padding()
//                    .foregroundColor(.white)
//                    .font(Fonts.large)
//            }
            
            TextField("", text: $file.name)
                .padding()
                .foregroundColor(.white)
                .font(Fonts.medium)
            
            Spacer()
            
            Button {
            } label: {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.white)
                    .padding()
            }
            
            Button {
            } label: {
                Image(systemName: "person.2.fill")
                    .foregroundColor(.white)
                    .padding()
            }
            
            Button {
            } label: {
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .padding()
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.black.opacity(0.4))
    }
}

//struct FileMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        FileMenuView()
//    }
//}
