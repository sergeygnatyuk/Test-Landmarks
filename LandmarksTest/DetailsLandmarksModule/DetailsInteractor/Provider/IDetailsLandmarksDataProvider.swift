import Foundation

protocol IDetailsLandmarksDataProvider: AnyObject {
    
    func getItems(completion: @escaping (Landmarks?, ErrorType?) -> Void)
}

