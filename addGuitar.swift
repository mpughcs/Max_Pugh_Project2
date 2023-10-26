//
//  addGuitar.swift
//  Lists
//
//  Created by Max Pugh on 10/17/23.
//

import Foundation
import SwiftUI

struct AddNewGuitar: View {
    @StateObject var guitarStore : GuitarStore
    @State var brand : String = ""
    @State var model : String = ""
    @State var year  :String = ""
    @State var color : String = ""
    @State var price : String = ""
    @State var forSale : Bool = false
    @State var imageUrl : String = ""

    var body: some View {
        Form {
                    Section(header: Text("Guitar Details")) {
                        Image(systemName: "guitar.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()

                        DataInput(title: "Brand", userInput: $brand).font(.headline)
                        DataInput(title: "Model", userInput: $model)
                        DataInput(title: "Year", userInput: $year)
                        DataInput(title: "Color", userInput: $color)
                        DataInput(title: "Price", userInput: $price)
                        Toggle(isOn: $forSale) {
                            Text("For Sale")
                        }

                        Button("Add New Guitar") {
                            addNewGuitar()
                            print("Added")
                        }
                    }
                }
    }
    func addNewGuitar(){
        let newGuitar = Guitar(id: UUID().uuidString, brand: brand, model: model, year: year, color: color, price: price, forSale: forSale)
        guitarStore.guitars.append(newGuitar)
    }
}


struct AddNewGuitar_Previews : PreviewProvider{
    static var previews: some View{
        AddNewGuitar(guitarStore: GuitarStore(guitars: guitarData))
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body : some View{
        VStack(alignment: HorizontalAlignment.leading){
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }
        .padding()
    }
}
