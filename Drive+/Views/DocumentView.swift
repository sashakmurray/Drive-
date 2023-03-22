//
//  DocumentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/6/23.
//

import SwiftUI

struct DocumentView: View {
    
    @Binding var file: Document
    @State var textColor = Color.black
    let colors: [Color] = [.black, .red, .green, .blue, .purple]
    var textView: TextView
    
    init(file: Binding<Document>) {
        self._file = file
        self.textView = TextView(text: file.content)
    }
    
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 8)
                    .foregroundColor(Color.black.opacity(0.4))
                
                VStack {
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
                    HStack {
                        Button {
                            self.textView.setItalics()
                        } label: {
                            Image(systemName: "italic")
                            .foregroundColor(.white)
                            .padding()
                        }
                        
                        Button {
                            self.textView.setUnderline()
                        } label: {
                            Image(systemName: "underline")
                                .foregroundColor(.white)
                            .padding()
                        }
                        
                        Button {
                            self.textView.setDiffColor(color: UIColor(textColor))
                        } label: {
                        Image(systemName: "textformat.size")
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        Picker("Color: ", selection: $textColor) {
                            ForEach(colors, id: \.self) { color in
                                Text(color.description.capitalized)
                                    .padding()
                                    .background(textColor)
                            }
                        }.foregroundColor(textColor)
                    }
                }
            }
            
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
