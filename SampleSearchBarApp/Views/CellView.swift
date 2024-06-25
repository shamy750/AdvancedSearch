//
//  CellView.swift
//  SampleSearchBarApp
//
//  Created by Softsuave on 24/06/24.
//

import SwiftUI

struct CellView: View {
    var persons: [Person]
    var body: some View {
        List(persons, id: \.self) { item in
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Phone: \(item.phone_number)".replacingOccurrences(of: ",", with: ""))
                    .font(.caption)
                    .fontWeight(.medium)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Banks:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .underline()
                        ForEach(item.banks, id: \.self) { bank in
                            Text("\(bank.name) -> \(bank.cards.map { $0.name }.joined(separator: ", "))")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}
