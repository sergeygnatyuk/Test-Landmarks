import Foundation

protocol DetailedLandmarkServiceProtocol {
    
    // MARK: - Methods
    func fetchItems(completion: @escaping (LandmarksModel?, Error?) -> Void)
}
