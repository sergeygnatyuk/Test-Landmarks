import Foundation

final class DetailedLandmarkService: DetailedLandmarkServiceProtocol {
    
    // MARK: - Public
    public func fetchItems(completion: @escaping (LandmarksModel?, Error?) -> Void) {
        completion(nil, nil)
    }
}
