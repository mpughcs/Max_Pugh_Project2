//
//  GuitarDetail.swift
//  Lists
//
//  Created by Max Pugh on 10/17/23.
//

import Foundation
import SwiftUI

struct GuitarDetail: View {
    @State private var isForSale: Bool

    init(selectedGuitar: Guitar) {
        self.selectedGuitar = selectedGuitar
        _isForSale = State(initialValue: selectedGuitar.forSale)
    }

    let selectedGuitar: Guitar

    var body: some View {
        Form {
            Section(header: Text("Guitar Details")) {
                Text("Brand: \(selectedGuitar.brand)")
                Text("Model: \(selectedGuitar.model)")

                Image(systemName: "guitars.fill")
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()

                Text("Year: \(selectedGuitar.year)")

                Toggle(isOn: $isForSale) {
                    Text("For Sale")
                }

                HStack {
                    Text("For Sale").font(.headline)
                    Spacer()
                    Text(isForSale ?  "Price: \(selectedGuitar.price)"
: "not for sale")
                }
            }
        }
    }
}


struct GuitardDetail_Previews: PreviewProvider{
    static var previews: some View{
        GuitarDetail(selectedGuitar: guitarData[0])
    }
}

