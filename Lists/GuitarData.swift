//
//  GuitarData.swift
//  Lists
//
//  Created by Max Pugh on 10/12/23.
//

import SwiftUI
var guitarData: [Guitar] = loadJson("GuitarData.json")

//this file loads and parses our json, throwing errors when they are encountered. 
func loadJson < T: Decodable> (_ filename:String) -> T {
    
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    do{
        data = try Data(contentsOf: file)
    } catch{
        fatalError("could not load, \(filename) not found.")
    }; do {
        return try JSONDecoder().decode(T.self, from:data)
    } catch{
        fatalError("unable to parse \(filename) : \(error)")

    }
}

