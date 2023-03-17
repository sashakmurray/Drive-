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
    @State var toolbar: Bool
    var textView: TextView
    
    init(file: Binding<Document>) {
        self._file = file
        self.toolbar = false
        self.textView = TextView(text: file.content)
    }
    
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 15)
                    .foregroundColor(Color.black.opacity(0.4))
                
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
                        toolbar = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.white)
                            .padding()
                    }
                    
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
            
            if toolbar {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 15)
                        .foregroundColor(Color.black.opacity(0.4))
                    HStack {
                        Image(systemName: "italic")
                            .padding()
                        
                        Image(systemName: "underline")
                            .padding()
                        
                        Button {
                            self.textView.setDiffColor(color: .red)
                            
                        } label: {
                        Image(systemName: "textformat.size")
                            .padding()
                        }
                    }
                }
            }
            
            
//            TextView(text: $file.content)
//                .padding(30)
            textView
                .padding(30)
            
            Spacer()
        }
    }
}

struct DocumentView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentView(file: Binding.constant(Document()))
    }
}
