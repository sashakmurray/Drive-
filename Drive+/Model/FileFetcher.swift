//
//  FileFetcher.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/31/23.
//

import Foundation
import SwiftUI

class FileFetcher: ObservableObject {
    @Published var response: Response = Response()
    @Published var file: Document = Document()
    
    func getData() async {
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                response = try JSONDecoder().decode(Response.self, from: data)
                let text = response.data.decodeUrl() ?? ""
                file = Document(name: response.name, content: text)
                if let string = try? NSAttributedString(data: text.data(using: .utf8) ?? Data(), options: [.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil) {
                    file.content = string.mutableCopy() as! NSMutableAttributedString
                    for i in 0..<string.length {
                        for attr in file.content.attributes(at: i, effectiveRange: nil) {
                            if attr.key.rawValue == "NSFont" {
                                file.content.addAttribute(NSAttributedString.Key.font, value: attr.value as! UIFont, range: NSRange(location: i, length: 1))
//                                print(attr.value as! UIFont)
                            }
                        }
                    }
                }
//                print(file.content)
              } catch {
                   print(error)
              }
        }
        
//        let URLString = "https://v2.thebannana32.repl.co/api/download?id=1Ba25i6xfEMb7l0tZQ2gW6_yt03qliaBgNq5j3aWv_Ls&name=sample.rtf"
//        guard let url = URL(string: URLString) else {return}
//        print(url)
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            print("hi")
//            response = try JSONDecoder().decode(Response.self, from: data)
//            print(response)
//            file = Document(name: response.name, content: response.data)
//            print(file.content)
//        } catch {
//            print(error)
//        }
    }
}

struct Response: Codable {
    var data: String = ""
    var name: String = ""
}


extension String
{
    func encodeUrl() -> String?
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    func decodeUrl() -> String?
    {
        return self.removingPercentEncoding
    }
}
