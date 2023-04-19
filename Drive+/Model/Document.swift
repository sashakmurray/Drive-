//
//  Document.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/28/23.
//

import Foundation

class Document: File {
    var content: NSMutableAttributedString
    
    init(name: String = "File1", created: Date = Date.now, last_modified: Date = Date.now, data: String = "hello") {
        self.content = NSMutableAttributedString(string: data)
        super.init(name: name, created: created, last_modified: last_modified, mime_type: "application/vnd.google-apps.document")
        self.data = data
    }
}
