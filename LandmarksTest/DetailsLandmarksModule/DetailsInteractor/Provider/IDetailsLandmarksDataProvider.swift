import Foundation

protocol IDetailsLandmarksDataProvider: AnyObject {
    
    func getItems(completion: @escaping ((Result<Landmarks, ErrorType>) -> Void))
}

