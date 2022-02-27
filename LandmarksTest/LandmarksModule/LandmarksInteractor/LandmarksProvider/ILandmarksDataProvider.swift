import Foundation

protocol ILandmarksDataProvider: AnyObject {
    
    // MARK: - Methods
    func getDataFromJSON(completion: ((Result<[LandmarksModel], Error>) -> Void))
}

