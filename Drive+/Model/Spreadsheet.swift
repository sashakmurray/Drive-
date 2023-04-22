//
//  Spreadsheet.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/20/23.
//

import Foundation
import SwiftUI

class Spreadsheet: File {
    @Published var content: [SpreadsheetRow] = []
    init(name: String, created: Date = Date.now, drive_id: String = "") {
        super.init(name: name, created: created, mime_type: "application/vnd.google-apps.document", drive_id: drive_id)
        for _ in 0..<40 {
            content.append(SpreadsheetRow())
        }
        //        self.content = [SpreadsheetRow(), SpreadsheetRow(), SpreadsheetRow()]
        
    }
    
    override func getData(metadata: FileMetadata) async {
        await super.getData(metadata: metadata)
        print("fnijsdgnisngs")
        guard let url = URL(string: "https://v2.thebannana32.repl.co/api/sheet?id=\(drive_id)") else {return}
        print("fnijsdgnisngs")
        //        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
        do {
            //                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(SheetResponse.self, from: data)
            self.data = response.data.decodeUrl() ?? ""
            var i = 0
            for row in (self.data as! String).split(whereSeparator: \.isNewline) {
                var objects: [String] = []
                for num in row.split(whereSeparator: {x in x == ","}) {
                    objects.append(String(num))
                }
                self.content[i] = SpreadsheetRow(objects)
                i += 1
            }
            print(self.content)
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

struct SpreadsheetRow: Identifiable {
    var id = UUID()
    var a: String
    var b: String
    var c: String
    var d: String
    
    init(_ objects: [String] = ["", "", "", ""]) {
        var objects = objects
        while objects.count < 4 {
            objects.append("")
        }
        self.a = objects[0]
        self.b = objects[1]
        self.c = objects[2]
        self.d = objects[3]
    }
}
