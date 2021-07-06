import Foundation

class DetailsLandmarksInteractor: IDetailsLandmarksInteractor {

    // MARK: - Dependencies
    var presenter: IDetailsLandmarksPresenter
   // var provider: IDetailsLandmarksDataProvider
    
    init(presenter: IDetailsLandmarksPresenter) {
        self.presenter = presenter
      //  self.provider = provider
    }
    
    // MARK: - Public
    public func getData(forLandmark: Landmarks) {
        presenter.prepareViewModel(for: forLandmark)
    }
}
