import Foundation

protocol IDetailsLandmarksDataProvider: AnyObject {
    
    // MARK: - Methods
    func parseData(state: Landmarks, controller: DetailLandmarksViewController)
}
