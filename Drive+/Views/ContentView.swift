//
//  ContentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var folder_metadata = FileMetadata(mimeType: "application/vnd.google-apps.folder", id: "root", name: "Home")
    
    var body: some View {
//        switch viewModel.state {
//            case .signedIn: ThumbnailListView()
//            case .signedOut: LoginView()
//        }
        NavigationView {
            FileView(file_metadata: $folder_metadata)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
