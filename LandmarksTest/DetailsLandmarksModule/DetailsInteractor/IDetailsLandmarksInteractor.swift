import Foundation

protocol IDetailsLandmarksInteractor {
    
    // MARK: - Propertyes
    var presenter: IDetailsLandmarksPresenter { get set }
    func getData(forLandmark: Landmarks)
}
