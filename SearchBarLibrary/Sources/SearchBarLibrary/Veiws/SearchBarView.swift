//
//  SearchBarView.swift
//
//
//  Created by Softsuave on 24/06/24.
//

import SwiftUI

@available(iOS 14.0, *)
public struct SearchBar<T: Equatable>: View {
    @Binding var text: String
    @Binding var filteredArray: [T]
    @Binding var isEditing: Bool
    @Binding var selectedFilters: [String]
    @Binding var filterOptions: [String: [String]]
    @State private var showFilterPopup = false
    
    private var textColor: Color
    private var placeHolderText: String
    private var borderColor: Color
    private var backgroundColor: Color
    private var foregroundColor: Color
    private var borderWidth: CGFloat
    private var searchIcon: Image
    private var searchIconTintColor: Color
    private var cancelText: String
    private var closeIcon: Image
    private var filterIcon: Image
    private var filterIconTintColor: Color
    private var cornerRadius: CGFloat
    private var corners: UIRectCorner
    private var array: [T]
    private var height: CGFloat
    private var width: CGFloat
    private var searchIconWidth: CGFloat
    private var filterFunction: Bool
    
    public init(
        text: Binding<String>,
        filteredArray: Binding<[T]>,
        isEditing: Binding<Bool>,
        selectedFilters: Binding<[String]>,
        filterOptions: Binding<[String: [String]]>,
        placeHolderText: String = "Search ...",
        textColor: Color = .primary,
        borderColor: Color = .gray,
        backgroundColor: Color = Color(.systemGray6),
        foregroundColor: Color = .blue,
        borderWidth: CGFloat = 1,
        searchIcon: Image = Image(systemName: "magnifyingglass"),
        searchIconTintColor: Color = .gray,
        cancelText: String = "Cancel",
        closeIcon: Image = Image(systemName: "multiply.circle.fill"),
        filterIcon: Image = Image(systemName: "line.horizontal.3.decrease.circle"),
        filterIconTintColor: Color = .gray,
        cornerRadius: CGFloat = 8,
        corners: UIRectCorner = .allCorners,
        array: [T],
        height: CGFloat = 40,
        width: CGFloat = .infinity,
        searchIconWidth: CGFloat = 25,
        filterFunction: Bool = false
    ) {
        self._text = text
        self._filteredArray = filteredArray
        self._isEditing = isEditing
        self._selectedFilters = selectedFilters
        self._filterOptions = filterOptions
        self.textColor = textColor
        self.placeHolderText = placeHolderText
        self.borderColor = borderColor
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.borderWidth = borderWidth
        self.searchIcon = searchIcon
        self.searchIconTintColor = searchIconTintColor
        self.cancelText = cancelText
        self.closeIcon = closeIcon
        self.filterIcon = filterIcon
        self.filterIconTintColor = filterIconTintColor
        self.cornerRadius = cornerRadius
        self.corners = corners
        self.array = array
        self.height = height
        self.width = width
        self.searchIconWidth = searchIconWidth
        self.filterFunction = filterFunction
    }
    
    public var body: some View {
        VStack {
            HStack {
                TextField(placeHolderText, text: $text)
                    .padding(7)
                    .padding(.leading, searchIconWidth + 10)
                    .frame(height: height)
                    .background(backgroundColor)
                    .foregroundColor(textColor)
                    .cornerRadius(cornerRadius, corners: corners)
                    .overlay(
                        HStack {
                            searchIcon
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: searchIconWidth)
                                .foregroundColor(searchIconTintColor)
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    closeIcon
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    )
                    .padding(.horizontal, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(borderColor, lineWidth: borderWidth)
                    )
                    .onTapGesture {
                        self.isEditing = true
                    }
                
                if(filterFunction) {
                    Button(action: {
                        self.showFilterPopup.toggle()
                    }) {
                        filterIcon
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: searchIconWidth)
                            .foregroundColor(filterIconTintColor)
                            .padding(.trailing, 10)
                    }
                }
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        selectedFilters = []
                        filteredArray = array
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text(cancelText)
                            .foregroundColor(foregroundColor)
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            .frame(width: width)
            .onChange(of: text) { newText in
                if newText.isEmpty {
                    filteredArray = array
                } else {
                    filteredArray = array.filter { "\($0)".localizedCaseInsensitiveContains(newText) }
                }
            }
            
            if isEditing && !selectedFilters.isEmpty {
                ChipsView(options: $selectedFilters) { option in
                    if let index = selectedFilters.firstIndex(of: option) {
                        selectedFilters.remove(at: index)
                        // Deselect the option in the filter options as well
                        filterOptions.keys.forEach { key in
                            if var filterArray = filterOptions[key], filterArray.contains(option) {
                                filterArray.removeAll { $0 == option }
                                filterOptions[key] = filterArray
                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .sheet(isPresented: $showFilterPopup) {
            FilterPopupView(filterOptions: $filterOptions, selectedFilters: $selectedFilters, presented: $showFilterPopup)
        }
    }
}
