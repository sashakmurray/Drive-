//
//  Folder.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/28/23.
//

import Foundation

class Folder: File, ObservableObject {
    var content: [File]
    var drive_id: String
    
    init(name: String = "File1", created: Date = Date.now, last_modified: Date = Date.now, drive_id: String) {
        self.drive_id = drive_id
        self.content = [File()]
        super.init(name: name, created: created, last_modified: last_modified, mime_type: "application/vnd.google-apps.folder")
    }
    
    func getContent() async {
        content.append(File())
    }
}
