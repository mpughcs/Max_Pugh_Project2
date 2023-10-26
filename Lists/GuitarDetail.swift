//
//  GuitarDetail.swift
//  Lists
//
//  Created by Max Pugh on 10/17/23.
//

import Foundation
import SwiftUI

//This view is responsible for displaying the details of a guitar.

struct GuitarDetail: View {
    @State private var isForSale: Bool

    init(selectedGuitar: Guitar) {
        self.selectedGuitar = selectedGuitar
        _isForSale = State(initialValue: selectedGuitar.forSale)
    }

    let selectedGuitar: Guitar
//    we maintain a selectedGuitar and isForSale state variable. The selectedGuitar is passed in from the parent view, and isForSale is initialized to the forSale property of the selectedGuitar.
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

