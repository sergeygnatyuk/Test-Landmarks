import Foundation

protocol IDetailsLandmarksDataProvider: AnyObject {
    
    func getDataFromJSON(completion: ((Result<[Landmarks], Error>) -> Void))
}

