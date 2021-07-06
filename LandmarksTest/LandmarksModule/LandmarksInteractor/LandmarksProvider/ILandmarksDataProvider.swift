import Foundation

protocol ILandmarksDataProvider: AnyObject {
    
    // MARK: - Methods
    func getDataFromJSON(completion: ((Result<[Landmarks], Error>) -> Void))
}

