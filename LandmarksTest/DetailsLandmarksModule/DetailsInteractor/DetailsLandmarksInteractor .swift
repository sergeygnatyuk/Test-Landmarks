import Foundation

class DetailsLandmarksInteractor: IDetailsLandmarksInteractor {

    // MARK: - Dependencies
    var presenter: IDetailsLandmarksPresenter
    var provider: IDetailsLandmarksDataProvider
    
    init(presenter: IDetailsLandmarksPresenter, provider: IDetailsLandmarksDataProvider) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: - Public
//   public func getData() {
//        provider.getDataFromJSON { result in
//            presenter.interactorDidFetchUsers(with: result)
//        }
//    }
}
