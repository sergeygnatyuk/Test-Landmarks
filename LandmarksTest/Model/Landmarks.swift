import CoreLocation

struct Landmarks: Hashable, Codable {
    var name: String
    var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var isFavorite: Bool
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
