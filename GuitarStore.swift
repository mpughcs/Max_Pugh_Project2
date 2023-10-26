//
//  CarStore.swift
//  Lists
//
//  Created by Max Pugh on 10/12/23.
//

import Foundation
import SwiftUI
import Combine

class GuitarStore: ObservableObject {
    @Published var guitars:[Guitar]
    init(guitars:[Guitar] = []){
        self.guitars = guitars
    }
}
