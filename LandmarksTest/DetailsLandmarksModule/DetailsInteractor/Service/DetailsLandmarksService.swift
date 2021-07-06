import Foundation

final class DetailedLandmarkService: DetailedLandmarkServiceProtocol {
    
    // MARK: - Public
    public func fetchItems(completion: @escaping (Landmarks?, Error?) -> Void) {
        completion(nil, nil)
    }
}
