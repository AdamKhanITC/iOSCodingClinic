import Foundation

struct CartProductResult {
    var id: Int
    var title: String
    var quantity: Int
}

let cartProducts = [
    CartProductResult(id: 1, title: "nike shoe 1", quantity: 5),
    CartProductResult(id: 2, title: "nike shoe 2", quantity: 2),
    CartProductResult(id: 3, title: "soap", quantity: 6)
]

func printProducts(_ inputArray: [CartProductResult]) {
    var ids: [String] = [] // To capture The Values

    // To append the correct information
    for cartProduct in cartProducts {
        ids.append("ID: \(cartProduct.id) Product: \(cartProduct.title)")
    }
    
    for id in ids {
        print(id)
    }
}

//MARK: Usi0ng Basic Syntax
var ids: [String] = [] // To capture The Values

// To append the correct information
for cartProduct in cartProducts {
    ids.append("ID: \(cartProduct.id) Product: \(cartProduct.title)")
}

//// To print each item line by line
//print("Method With No Higher Order Functions")
//for id in ids {
//    print(id)
//}
//print("\n")

//MARK: Using Higher Order Functions
//print("Using Higher Order Functions")
//// No short hand arguments as CartProducts does not conform to the protocols
//let HOFids: () = cartProducts.map { CartProductResult -> String in "\(CartProductResult.id)-\(CartProductResult.title)" }.forEach{Line in print(Line)}

struct SearchProductResult {
    var id: Int
    var title: String
    var position: Int
}
let productList: [SearchProductResult] = [
    SearchProductResult(id: 1, title: "nike shoe 3", position: 1),
    SearchProductResult(id: 5, title: "pen", position: 2)
]

func printProducts(_ inputArray: [SearchProductResult]) {
    var ids: [String] = [] // To capture The Values
    // To append the correct information
    for cartProduct in productList {
        ids.append("ID: \(cartProduct.id) Product: \(cartProduct.title)")
    }
    for id in ids {
        print(id)
    }
}

// Overloaded Function but not Generic
printProducts(cartProducts)
printProducts(productList)

func printWithDelay(product1: CartProductResult, product2: CartProductResult, completion: (@escaping ()-> Void)) {
    
    // Wait 1 second
    print("Waiting 1 Second")
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        print("Waited 1 Second")
        print("\(product1.id)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("Waited 2 Seconds")
            print("\(product2.id)")
            completion()
        }
    }
    // Print id of first product
    
    // Wait 1 second
    
    // Print id of second product
    
    // Call completion
    
}

printWithDelay(product1: cartProducts[0], product2: cartProducts[1]) {
    print("Done printing products")
}

let json = """
{
  "id": "1",
  "options": [
    {
      "id": "11",
      "options": [
        {
          "id": "111",
          "options": []
} ]
}, {
      "id": "2",
      "options": [
        {
          "id": "21",
          "options": []
}, {
          "id": "22",
          "options": [
            {
              "id": "221",
              "options": []
} ]
} ]
} ]
}
"""

struct JSONStruct: Decodable {
    let id: String
    let options: [JSONStruct]
}

func printIds(_ obj: JSONStruct){
    print(obj.id)
    if !obj.options.isEmpty {obj.options.forEach {printIds($0)}}
}

let data = json.data(using: .utf8)!
do {
    let pasedData = try JSONDecoder().decode(JSONStruct.self, from: data)
    printIds(pasedData)
} catch {
    print(error)
}
