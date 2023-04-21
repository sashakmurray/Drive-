//
//  ContentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var titleScreen = true
    @State var folder_metadata = FileMetadata(mimeType: "application/vnd.google-apps.folder", id: "root", name: "Home")
    
    var body: some View {
//        switch viewModel.state {
//            case .signedIn:  NavigationView { ThumbnailListView(folder_metadata: $folder_metadata)}
//            case .signedOut: LoginView()
//        }
        if titleScreen {
            TitleView(titleScreen: $titleScreen)
        } else {
            NavigationView { ThumbnailListView(folder_metadata: $folder_metadata)}
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
