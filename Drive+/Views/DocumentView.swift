//
//  DocumentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/6/23.
//

import SwiftUI

struct DocumentView: View {
    
    @Binding var file: Document
    @Binding var data: FileFetcher
    @State var textColor = Color.black
    let colors: [Color] = [.black, .red, .green, .blue, .purple]
    var textView: TextView
    @State var editing = true
    
    init(file: Binding<Document>, data: Binding<FileFetcher>) {
        self._data = data
        self.textView = TextView(text: data.file.content)
        self._file = file
    }
    
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button {
                    } label: {
                        Text("<")
                        .padding()
                        .foregroundColor(.white)
                        .font(Fonts.large)
                    }
                    
                    TextField("", text: $file.name)
                        .padding()
                        .foregroundColor(.white)
                        .font(Fonts.medium)
                        .task {
                            await data.getData()
                        }
                    
                    Spacer()
                    
                    Button {
                        editing.toggle()
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
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.black.opacity(0.4))
                if editing {
                    HStack {
                        Button {
                            self.textView.setItalics()
                        } label: {
                            if self.textView.checkAttribute(key: NSAttributedString.Key.obliqueness) {
                                Image(systemName: "italic")
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.black.opacity(0.3))
                            } else {
                                Image(systemName: "italic")
                                    .foregroundColor(.white)
                                    .padding()
                            }
                        }
                        
                        Button {
                            self.textView.setUnderline()
                        } label: {
                            Image(systemName: "underline")
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        ColorPicker("", selection: $textColor)
                            .foregroundColor(textColor)
                        
                        Button {
                            self.textView.setDiffColor(color: UIColor(textColor))
                        } label: {
                            Image(systemName: "a")
                                .foregroundColor(textColor)
                                .padding()
                        }
                        
                        Button {
                            self.textView.setHighlight(color: UIColor(textColor))
                        } label: {
                            Image(systemName: "paintbrush.fill")
                                .foregroundColor(textColor)
                                .padding()
                        }
                        Spacer()
                        
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.black.opacity(0.25))
                        .offset(y: -8)
                }
            }
            
            textView
                .padding(30)
                .task {
                    await data.getData()
                    print("hellooo")
                    textView.view.attributedText = data.file.content
                }
            
            Spacer()
        }
    }
}

struct DocumentView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentView(file: Binding.constant(Document()), data: Binding.constant(FileFetcher()))
    }
}
