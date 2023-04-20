//
//  File.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/28/23.
//

import Foundation

extension Formatter {
    static let iso8601withFractionalSeconds: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        return formatter
    }()
}

extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601 = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = Formatter.iso8601withFractionalSeconds.date(from: string) ?? Formatter.iso8601.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}

class File: Identifiable, ObservableObject {
    @Published var name: String
    @Published var data: Any?
    @Published var created: String
    @Published var last_modified: String
    @Published var mime_type: String
    @Published var file_size: Int
    @Published var drive_id: String
    @Published var icon_link: String
    let id: UUID = UUID()
    let formatter = DateFormatter()
    
    init(name: String, data: Any? = nil, created: Date = Date(), last_modified: Date = Date(), mime_type: String = "application/vnd.google-apps.document", file_size: Int = 0, drive_id: String = "", icon_link: String = "") {
        
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        self.name = name
        self.data = data
        self.created =  formatter.string(from: created)
        self.last_modified = formatter.string(from: last_modified)
        self.mime_type = mime_type
        self.file_size = file_size
        self.drive_id = drive_id
        self.icon_link = icon_link
    }
    
    func getData(metadata: FileMetadata) async {
        self.name = metadata.name
        self.drive_id = metadata.id
        self.mime_type = metadata.mimeType

        guard let url = URL(string: "https://v2.thebannana32.repl.co/api/get?id=\(drive_id)") else {return}
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .customISO8601
            let response = try decoder.decode(FileResponse.self, from: data)
            created =  formatter.string(from: response.data.createdTime)
            last_modified =  formatter.string(from: response.data.modifiedTime)
            icon_link =  response.data.iconLink
        } catch {
            print(error)
        }
    }
}

struct FileResponse: Codable {
    var data: FileResponseData
}

struct FileResponseData: Codable {
    var createdTime: Date
    var modifiedTime: Date
    var iconLink: String
}
