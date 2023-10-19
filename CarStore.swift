//
//  CarStore.swift
//  Lists
//
//  Created by Max Pugh on 10/12/23.
//

import Foundation
import SwiftUI
import Combine

class CarStore: ObservableObject {
    @Published var cars:[Car]
    init(cars:[Car] = []){
        self.cars = cars
    }
}
