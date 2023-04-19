//
//  File.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/28/23.
//

import Foundation

enum Type {
    case folder, document
}

class File: Identifiable {
    var name: String
    var data: Any?
    var created: String
    var last_modified: String
    var mime_type: String
    var file_size: Int
    
    init(name: String = "File1", data: Any? = nil, created: Date = Date(), last_modified: Date = Date(), mime_type: String = "application/vnd.google-apps.document", file_size: Int = 0) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        self.name = name
        self.data = data
        self.created =  formatter.string(from: created)
        self.last_modified = formatter.string(from: last_modified)
        self.mime_type = mime_type
        self.file_size = file_size
    }
}
