//
//  FileFetcher.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/31/23.
//

import Foundation
import Foundation

class FileFetcher: ObservableObject {
    @Published var response: Response = Response()
    @Published var file: File = File()
    
    func getData() async {
        let URLString = "https://v2.thebannana32.repl.co/test?id=1Ba25i6xfEMb7l0tZQ2gW6_yt03qliaBgNq5j3aWv_Ls&name=sample.rtf"
//        let URLString = "https://lmsd.blackboard.com/webapps/blackboard/content/listContent.jsp?course_id=_96269_1&content_id=_1494163_1&mode=reset"
        guard let url = URL(string: URLString) else {return}
//        print(url)
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("hi")
            response = try JSONDecoder().decode(Response.self, from: data)
            print(response)
            file = Document(name: response.name, content: response.data)
        } catch {
            print(error)
        }
    }
}

struct Response: Codable {
    var data: String = ""
    var name: String = ""
}
