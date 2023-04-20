//
//  Folder.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/28/23.
//

import Foundation

class Folder: File {
    @Published var content: [FileMetadata]
    
    init(name: String = "File1", created: Date = Date.now, drive_id: String = "") {
        self.content = []
        super.init(name: name, created: created, mime_type: "application/vnd.google-apps.folder", drive_id: drive_id)
    }
    
    override func getData(metadata: FileMetadata) async {
        name = metadata.name
        drive_id = metadata.id
        mime_type = metadata.mimeType
        
        guard let url = URL(string: "https://v2.thebannana32.repl.co/api/folder?id=\(drive_id)") else {return}
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(FolderResponse.self, from: data)
            content = response.files
        } catch {
            print(error)
        }
    }
}

struct FolderResponse: Codable {
    var files: [FileMetadata]
}

struct FileMetadata: Codable, Identifiable {
    var mimeType: String
    var id: String
    var name: String
}
