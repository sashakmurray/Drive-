//
//  SpreadsheatView.swift
//  Drive+
//
//  Created by Nathan Donagi (student LM) on 4/20/23.
//

import SwiftUI

struct SpreadsheetView: View {
    @Binding var spreadsheet_metadata: FileMetadata
    @StateObject var spreadsheet: Spreadsheet = Spreadsheet(name: "Loading")
    
    var body: some View {
        VStack{
            Text("uwu")
            Text(spreadsheet.data as? String ?? " ")
        }.task{
            await spreadsheet.getData(metadata: spreadsheet_metadata)
        }
    }
}

//struct SpreadsheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpreadsheatView()
//    }
//}
