//
//  Document.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/28/23.
//

import Foundation
import SwiftUI

class Document: File {
    var content: NSMutableAttributedString
    
    init(name: String = "File1", created: Date = Date.now, last_modified: Date = Date.now, data: String = "hello") {
        if let string = try? NSAttributedString(data: data.data(using: .utf8) ?? Data(), options: [.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil) {
            self.content = string.mutableCopy() as! NSMutableAttributedString
            for i in 0..<string.length {
                for attr in self.content.attributes(at: i, effectiveRange: nil) {
                    if attr.key.rawValue == "NSFont" {
                        self.content.addAttribute(NSAttributedString.Key.font, value: attr.value as! UIFont, range: NSRange(location: i, length: 1))
                    }
                }
            }
        }
        
        self.content = NSMutableAttributedString(string: data)
        super.init(name: name, created: created, last_modified: last_modified, mime_type: "application/vnd.google-apps.document")
        self.data = data
        
    }
}
