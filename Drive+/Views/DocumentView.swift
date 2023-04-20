//
//  DocumentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/6/23.
//

import SwiftUI

struct DocumentView: View {
    
    @Binding var document_metadata: FileMetadata
    @State var document: Document = Document(name: "Loading")
    
    var body: some View {
        Spacer().task {
            await document.getData(metadata: document_metadata)
        }
    }
}

//struct DocumentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentView(document: Binding.constant(Document()))
//    }
//}
