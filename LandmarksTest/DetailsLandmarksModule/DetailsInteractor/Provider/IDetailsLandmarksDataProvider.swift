import Foundation

protocol IDetailsLandmarksDataProvider: AnyObject {
    
    // MARK: - Methods
    func parseData(state: LandmarksModel, controller: DetailLandmarksViewController)
}
