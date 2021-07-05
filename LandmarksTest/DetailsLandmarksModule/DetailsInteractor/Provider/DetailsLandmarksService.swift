import Foundation
protocol DetailedLandmarkServiceProtocol {
    func fetchItems(completion: @escaping (Landmarks?, Error?) -> Void)
}

class DetailedLandmarkService: DetailedLandmarkServiceProtocol {

    func fetchItems(completion: @escaping (Landmarks?, Error?) -> Void) {
        completion(nil, nil)
    }
}
