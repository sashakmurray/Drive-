//
//  DocumentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 3/6/23.
//

import SwiftUI

struct DocumentView: View {
    
    @Binding var document_metadata: FileMetadata
    @StateObject var document: Document = Document(name: "Loading")
    @State var textColor = Color.black
    let colors: [Color] = [.black, .red, .green, .blue, .purple]
    @State var editing = true
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State var textView: TextView?
    
    var body: some View {
        VStack {
            VStack {
                HStack {
//                    Button {
//                    } label: {
//                        Image(systemName: "arrow.left.circle.fill")
//                            .padding()
//                            .foregroundColor(.white)
//                            .font(Fonts.large)
//                    }
                    
                    TextField("", text: $document.name)
                        .padding()
                        .foregroundColor(.white)
                        .font(Fonts.medium)
                    
                    Spacer()
                    
                    Button {
                        self.editing.toggle()
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
                            self.textView!.setItalics()
                        } label: {
                            Image(systemName: "italic")
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        Button {
                            self.textView!.setUnderline()
                        } label: {
                            Image(systemName: "underline")
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bold")
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        ColorPicker("", selection: $textColor)
                            .foregroundColor(textColor)
                        
                        Button {
                            self.textView!.setDiffColor(color: UIColor(textColor))
                        } label: {
                            Image(systemName: "a")
                                .foregroundColor(textColor)
                                .padding()
                        }
                        
                        Button {
                            self.textView!.setHighlight(color: UIColor(textColor))
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
            Spacer()
        }.task{
            await document.getData(metadata: document_metadata)
            textView = TextView(text: $document.content)
            textView!.view.attributedText = textView!.text
        }.onReceive(timer) { time in
            if let temp = textView!.view.attributedText as? NSMutableAttributedString{
                textView!.text = temp
            }
            
            document.data = textView!.pushData()
            Task {
                if(editing){
                    print("editing -------------------")
                    document.data = textView!.pushData()
                    await document.update()
                }else{
                    print("downloading -------------------")
                    await document.getData(metadata: document_metadata)
                    textView = TextView(text: $document.content)
                    textView!.view.attributedText = textView!.text
                }
              }
        }
    }
}

//struct DocumentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentView(document: Binding.constant(Document()))
//    }
//}
