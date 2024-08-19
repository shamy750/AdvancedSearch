//
//  ContentView.swift
//  SampleSearchBarApp
//
//  Created by Softsuave on 24/06/24.
//

import SwiftUI
import SearchBarLibrary

struct ContentView: View {
    
    @State var text: String = ""
    @State var filteredArray: [Person] = []
    @State var isEditing: Bool = false
    @State var selectedFilters: [String] = []
    @State private var filterOptions: [String: [String]] = ["Banks": banks, "Cards": cards]
    
    
    var body: some View {
        VStack {
            
            SearchBar(
                text: $text,
                filteredArray: $filteredArray,
                selectedFilters: $selectedFilters,
                filterOptions: $filterOptions,
                placeHolderText: "Contacts",
                borderWidth: 0,
                searchIcon: Image(systemName: "doc.text.magnifyingglass"),
                cancelText: "Clear",
                cornerRadius: 20,
                corners: UIRectCorner(arrayLiteral: .bottomLeft, .topRight),
                array: persons, searchIconWidth: 25,
                filterFunction: true,
                filterHeaderText: "Bank & Cards"
            )
            
            CellView(persons: text.isEmpty && selectedFilters.isEmpty ? persons : filteredArray)
            
        }
    }
}

#Preview {
    ContentView()
}

