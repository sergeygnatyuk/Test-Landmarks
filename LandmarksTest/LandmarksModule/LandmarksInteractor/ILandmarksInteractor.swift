import Foundation

protocol ILandmarksInteractor {
    
    // MARK: - Properties
    var presenter: ILandmarksPresenter { get set }
    
    // MARK: - Methods
    func getData()
}
