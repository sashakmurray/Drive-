//
//  Document.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/28/23.
//

import Foundation

class Document: File {
    var data: String?
    
    init(data: String = "hello") {
        self.data = data
    }
}
