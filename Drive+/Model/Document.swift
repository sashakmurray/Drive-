//
//  Document.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/28/23.
//

import Foundation
import SwiftUI

class Document: File {
    @Published var content: NSMutableAttributedString
    
    init(name: String, created: Date = Date.now, data: String = "hello", drive_id: String = "") {
        self.content = NSMutableAttributedString(string: data)
        super.init(name: name, created: created, mime_type: "application/vnd.google-apps.document", drive_id: drive_id)
        
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
        
        self.data = data
    }
    
    func update() async{
        guard let url = URL(string: "https://v2.thebannana32.repl.co/api/update") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "id": drive_id,
            "name": name,
            "mimeType": mime_type,
            "data": (data as! String).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = jsonData
        
        do {
            let task = URLSession.shared.dataTask(with: request)
            task.resume()
        } catch {
            print(error)
        }
        
    }
    override func getData(metadata: FileMetadata) async {
        await super.getData(metadata: metadata)
//
//        guard let url = URL(string: "https://v2.thebannana32.repl.co/api/export?id=\(drive_id)") else {return}
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let response = try JSONDecoder().decode(FileResponse.self, from: data)
//        } catch {
//            print(error)
//        }
    }
}

struct DocumentResponse: Codable {
}
