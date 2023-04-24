////
////  ImageView.swift
////  Drive+
////
////  Created by Nathan Donagi (student LM) on 4/24/23.
////
//
//import SwiftUI
//
//struct ImageView: View {
//    @Binding var image_metadata: FileMetadata
//    @StateObject var imageFile: ImageFile = ImageFile(name: "Loading")
//    
//    var body: some View {
//        imageFile.content.task {
//            await imageFile.getData(metadata: image_metadata)
//        }
//    }
//}
//
////struct ImageView_Previews: PreviewProvider {
////    static var previews: some View {
////        ImageView()
////    }
////}
