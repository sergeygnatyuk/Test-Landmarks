import Foundation

protocol ILandmarksInteractor {
    
    // MARK: - Propertyes
    var presenter: ILandmarksPresenter { get set }
    
    func getData()
}
