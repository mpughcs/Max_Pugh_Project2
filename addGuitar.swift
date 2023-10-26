//
//  addGuitar.swift
//  Lists
//
//  Created by Max Pugh on 10/17/23.
//

import Foundation
import SwiftUI

//this view is responsible for adding a new guitar to the list

struct AddNewGuitar: View {
    @StateObject var guitarStore : GuitarStore
    @State var brand : String = ""
    @State var model : String = ""
    @State var year  :String = ""
    @State var color : String = ""
    @State var price : String = ""
    @State var forSale : Bool = false
    @State var imageUrl : String = ""

    
//    here we are creating a new guitar object and adding it to the list
    var body: some View {
        Form {
                    Section(header: Text("Add Guitar")) {
                        Image(systemName: "guitars.fill")
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
//    this function creates a new guitar object and adds it to the list
    func addNewGuitar(){
        let newGuitar = Guitar(id: UUID().uuidString, brand: brand, model: model, year: year, color: color, price: price, forSale: forSale)
        guitarStore.guitars.append(newGuitar)
    }
}

// this is the preview for the addNewGuitar view
struct AddNewGuitar_Previews : PreviewProvider{
    static var previews: some View{
        AddNewGuitar(guitarStore: GuitarStore(guitars: guitarData))
    }
}

// this is a helper view that creates a text field for the user to input data
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
