import Foundation

protocol IDetailsLandmarksInteractor {

    // MARK: - Propertyes
    var presenter: IDetailsLandmarksPresenter { get set }
    
    // MARK: - Methods
    func getData(forLandmark: Landmarks)
}
