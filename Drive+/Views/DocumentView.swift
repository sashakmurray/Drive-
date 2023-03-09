//
//  DocumentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/6/23.
//

import SwiftUI
import WebKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

struct DocumentView: View {
    
    @Binding var file: Document
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 15)
                    .foregroundColor(Color.black.opacity(0.5))
                
                HStack {
                    Button {
                    } label: {
                        Text("<")
                        .padding()
                        .foregroundColor(.white)
                        .font(Fonts.large)
                    }
                    Spacer()
                    
                    Button {
                    } label: {
                        Image(systemName: "person.2.fill")
                        .foregroundColor(.white)
                        .padding()
                    }

                    Button {
                    } label: {
                        Image(systemName: "gear")
                        .foregroundColor(.white)
                        .padding()
                    }
                }
            }
            
            Spacer()
            Text(file.content)
                .frame(alignment: .leading)
        }
    }
}

struct DocumentView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentView(file: Binding.constant(Document()))
    }
}
