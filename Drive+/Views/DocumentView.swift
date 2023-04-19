//
//  DocumentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/6/23.
//

import SwiftUI

struct DocumentView: View {
    
    @Binding var file: File
    var document: Document { file as! Document}
    
    var body: some View {
        Spacer()
        Text("hi")
    }
}

//struct DocumentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentView(document: Binding.constant(Document()))
//    }
//}
