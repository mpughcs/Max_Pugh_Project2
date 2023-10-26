//
//  ContentView.swift
//  Lists
//
//  Created by Max Pugh on 10/12/23.
//

import SwiftUI

// in this view, we will display a list of guitars
struct ContentView: View {
    @StateObject var guitarStore: GuitarStore = GuitarStore(guitars: guitarData)
    var body: some View {
        NavigationView{
            List{
                ForEach (guitarStore.guitars) { guitar in
                    ListCell(guitar: guitar)
                    
                }.onDelete(perform: deleteItems)
                    .onMove(perform:moveItems)
            }
            .navigationBarTitle(Text(" Guitar wish list"))
            .navigationBarItems        (leading:NavigationLink(destination:AddNewGuitar(guitarStore:self.guitarStore)){
                Text("Add")
            }, trailing:EditButton())
            
        }
    }
//    this function deletes items from the list
    func deleteItems(at offsets: IndexSet){
        guitarStore.guitars.remove(atOffsets: offsets)
    }
    
//    this function moves items in the list
    func moveItems(from source: IndexSet, to destination: Int){
        guitarStore.guitars.move(fromOffsets: source, toOffset: destination)
    }
}

//this view defines the layout of each cell in the list
struct ListCell: View {
    var guitar : Guitar
    var body: some View{
        NavigationLink(destination: GuitarDetail(selectedGuitar: guitar)){
            HStack{
                Image(systemName: "guitars.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text("\(guitar.brand) \(guitar.model)")
            }
            
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
