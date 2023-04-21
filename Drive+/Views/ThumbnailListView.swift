//
//  ThumbnailListView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/19/23.
//

//uwu

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

struct AsyncButton<Label: View>: View {
    var action: () async -> Void
    @ViewBuilder var label: () -> Label
    
    @State private var isPerformingTask = false
    
    var body: some View {
        Button(
            action: {
                isPerformingTask = true
                
                Task {
                    await action()
                    isPerformingTask = false
                }
            },
            label: {
                ZStack {
                    // We hide the label by setting its opacity
                    // to zero, since we don't want the button's
                    // size to change while its task is performed:
                    label().opacity(isPerformingTask ? 0 : 1)
                    
                    if isPerformingTask {
                        ProgressView()
                    }
                }
            }
        )
        .disabled(isPerformingTask)
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
                    HStack{
                        AsyncButton {
                            await folder.new_folder()
                            await folder.getData(metadata: folder_metadata)
                        } label: {
                            Text("New Folder")
                        }
                        
                        AsyncButton {
                            await folder.new_file()
                            await folder.getData(metadata: folder_metadata)
                        } label: {
                            Text("New File")
                        }
      
                        Toggle(isOn: $editing) {
                            Text("edit")
                        }.toggleStyle(iOSCheckboxToggleStyle())
                            .onChange(of: editing) { value in
                                for index in folder.content.indices{
                                    folder.content[index].editable = false
                                }
                            }
                        
                        if(editing){
                            AsyncButton {
                                print("")
                                for index in folder.content.indices{
                                    if(folder.content[index].editable){
                                        let temp: FileMetadata = folder.content[index]
                                        await folder.delete(metadata: temp, index: index)
                                    }
                                }

                                folder.remove_deleted()
                            } label: {
                                Text("delete")
                            }
                            
                        }else{
                            Spacer()
                        }
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
