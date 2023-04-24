////
////  Image.swift
////  Drive+
////
////  Created by Nathan Donagi (student LM) on 4/24/23.
////
//
//import Foundation
//import SwiftUI
//
//class ImageFile: File {
//    @Published var content: Image
//
//    init(name: String, created: Date = Date.now, drive_id: String = "") {
//        super.init(name: name, created: created, mime_type: "image/jpeg", drive_id: drive_id)
//        self.content = Image(systemName: "doc")
//
//
//    }
//
//    override func getData(metadata: FileMetadata) async {
//        await super.getData(metadata: metadata)
//        print("fnijsdgnisngs")
//        guard let url = URL(string: "https://v2.thebannana32.repl.co/api/download?id=\(drive_id)") else {return}
//
//        do {
//
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let response = try JSONDecoder().decode(SheetResponse.self, from: data)
//            self.data = response.data.decodeUrl() ?? ""
//            self.content = Image(uiImage: UIImage(data: Data(base64Encoded: self.data)!)!)
//        } catch {
//            print(error)
//        }
//    }
//}
//
//struct ImageResponse: Codable {
//    var data: String
//}
