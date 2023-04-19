//
//  ContentView.swift
//  Drive+
//
//  Created by Sasha Murray (student LM) on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var file: Document = Document()
    @State var fileFetcher = FileFetcher()
    
    var body: some View {
        switch viewModel.state {
            case .signedIn: ThumbnailListView()
            case .signedOut: LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
