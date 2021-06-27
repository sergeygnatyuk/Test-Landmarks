import Foundation

struct Location {
    let name: String
    let category: String
    let city: String
    let state: String
    let id: Int
    let park: String
    let coordinates: Coordinates
    let imageName: String
    let isFavourite: Bool
}

struct Coordinates {
    let longitude: Double
    let latitude: Double
}

