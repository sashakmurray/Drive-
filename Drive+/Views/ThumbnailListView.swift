//
//  ThumbnailListView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/19/23.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
            
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
}

struct ThumbnailListView: View {
    @Binding var folder_metadata: FileMetadata
    @StateObject var folder: Folder = Folder()
    @State var editing: Bool = false
    
    var body: some View {
        VStack{
            ZStack {
                    Color.gray
                        .frame(width: UIScreen.main.bounds.width, height: 150*CGFloat(folder.content.count), alignment: .top)
                        .opacity(0.1)
                        .cornerRadius(10)
                        VStack{
                            HStack {
                                Spacer()
                                Toggle(isOn: $editing) {
                                    Text("edit")
                                        .font(Fonts.medium)
                                }.toggleStyle(iOSCheckboxToggleStyle())
                                    .onChange(of: editing) { value in
                                        for index in folder.content.indices{
                                            folder.content[index].editable = false
                                        }
                                    }
                                .padding()
                                .foregroundColor(.black)
                            }

                            
                        
                            if(editing){
                                List($folder.content) { $file_metadata in
                                    Toggle(isOn: $file_metadata.editable) {
                                        ThumbnailView(file_metadata: $file_metadata)
                                    }.toggleStyle(iOSCheckboxToggleStyle())
                                }
                            }else{
                                List($folder.content) { $file_metadata in
                                    NavigationLink(destination: FileView(file_metadata: $file_metadata)) {
                                        ThumbnailView(file_metadata: $file_metadata)
                                    }
                                }
                            }
                        }.navigationTitle(Text(folder.name))
                        
            }.task{
                await folder.getData(metadata: folder_metadata)
            }
        }
        
    }
}

//
//struct ThumbnailListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThumbnailListView(folder: Binding.constant([File()]))
//    }
//}
