import Foundation


//this struct represents our data object outlined by our json
struct Guitar : Codable, Identifiable{
    var id: String
    var brand: String
    var model: String
    var year : String
    var color: String
    var price : String
    var forSale: Bool
    

}


