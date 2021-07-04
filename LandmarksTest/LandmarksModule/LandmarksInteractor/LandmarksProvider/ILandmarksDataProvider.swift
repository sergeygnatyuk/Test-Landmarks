import Foundation

protocol ILandmarksDataProvider: AnyObject {
    
    func getDataFromJSON(completion: ((Result<[Landmarks], Error>) -> Void))
}

