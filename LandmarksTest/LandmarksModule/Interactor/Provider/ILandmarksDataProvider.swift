import Foundation

protocol ILandmarksDataProvider: AnyObject {
    func getDataFromJSON(completion: ((Result<Data, Error>) -> Void))
}

