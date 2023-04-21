//
//  Spreadsheet.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/20/23.
//

import Foundation
import SwiftUI

class Spreadsheet: File {
    init(name: String, created: Date = Date.now, drive_id: String = "") {
        super.init(name: name, created: created, mime_type: "application/vnd.google-apps.document", drive_id: drive_id)
    }
    
    override func getData(metadata: FileMetadata) async {
        await super.getData(metadata: metadata)
        guard let url = URL(string: "https://v2.thebannana32.repl.co/api/sheet?id=\(drive_id)") else {return}
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            self.data = data
            let response = try JSONDecoder().decode(SheetResponse.self, from: data)
            self.data = response.data.decodeUrl() ?? ""
            
        } catch {
            print(error)
        }
    }
}

struct SheetResponse: Codable {
    var id: String
    var name: String
    var mimeType: String
    var data: String
}
