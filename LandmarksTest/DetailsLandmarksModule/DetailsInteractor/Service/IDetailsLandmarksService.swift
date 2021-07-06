import Foundation

protocol DetailedLandmarkServiceProtocol {
    
    // MARK: - Methods
    func fetchItems(completion: @escaping (Landmarks?, Error?) -> Void)
}
