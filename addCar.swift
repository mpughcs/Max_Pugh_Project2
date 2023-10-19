//
//  addCar.swift
//  Lists
//
//  Created by Max Pugh on 10/17/23.
//

import Foundation
import SwiftUI

struct AddNewCar: View {
    @StateObject var carStore : CarStore
    @State var isHybrid : Bool = false
    @State var name : String = ""
    @State var description: String = ""
    var body: some View {
        Form {
            Section(header: Text("Car Details")){
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title:"Model", userInput: $name)
                DataInput(title:"Description", userInput: $description)
                Toggle(isOn: $isHybrid){
                    Text("hybrid")
                }
                Button("Add New Car") {
                    addNewCar()
                    print("added")
                }
            }
        }
    }
    func addNewCar(){
        let newCar = Car(id: UUID().uuidString,
                         name: name, description: description, isHybrid: isHybrid, imageName:"tesla_model_3")
        carStore.cars.append(newCar)
    }
}


struct AddNewCar_Previews : PreviewProvider{
    static var previews: some View{
        AddNewCar(carStore: CarStore(cars: carData))
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
