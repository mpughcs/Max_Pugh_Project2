//
//  ContentView.swift
//  Lists
//
//  Created by Max Pugh on 10/12/23.
//

import SwiftUI

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
    func deleteItems(at offsets: IndexSet){
        guitarStore.guitars.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int){
        guitarStore.guitars.move(fromOffsets: source, toOffset: destination)
    }
}

struct ListCell: View {
    var guitar : Guitar
    var body: some View{
        NavigationLink(destination: GuitarDetail(selectedGuitar: guitar)){
            HStack{
                Image(systemName: "guitars.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                
                    
                Text(guitar.model)
            }
            
        }
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
