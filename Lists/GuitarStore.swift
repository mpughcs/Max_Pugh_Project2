//
//  CarStore.swift
//  Lists
//
//  Created by Max Pugh on 10/12/23.
//

import Foundation
import SwiftUI
import Combine

//this class keeps an array of guitar objects to be shown to the user. 
class GuitarStore: ObservableObject {
    @Published var guitars:[Guitar]
    init(guitars:[Guitar] = []){
        self.guitars = guitars
    }
}
