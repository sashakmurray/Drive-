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

class File {
    var name: String
    var created: Date
    var last_modified: Date
    var type: Type
    
    init(name: String = "File1", created: Date = Date.now, last_modified: Date = Date.now, type: Type = .folder) {
        self.name = name
        self.created = created
        self.last_modified = last_modified
        self.type = type
    }
}
