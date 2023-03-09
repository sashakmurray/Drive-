//
//  Document.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/28/23.
//

import Foundation

class Document: File {
    var content: String
    
    init(name: String = "File1", created: Date = Date.now, last_modified: Date = Date.now, type: Type = .document, content: String = "hello") {
        self.content = content
        super.init(name: name, created: created, last_modified: last_modified, type: type)
    }
}
