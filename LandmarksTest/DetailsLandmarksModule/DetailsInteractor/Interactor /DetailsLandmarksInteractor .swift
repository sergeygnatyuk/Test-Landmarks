import Foundation

final class DetailsLandmarksInteractor: IDetailsLandmarksInteractor {

    // MARK: - Dependencies
    var presenter: IDetailsLandmarksPresenter
    
    // MARK: - Initialization
    init(presenter: IDetailsLandmarksPresenter) {
        self.presenter = presenter
    }
    
    // MARK: - Public
    public func getData(forLandmark: Landmarks) {
        presenter.prepareViewModel(for: forLandmark)
    }
}
