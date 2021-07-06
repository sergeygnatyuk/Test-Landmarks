import Foundation

final class LandmarksInteractor : ILandmarksInteractor {
    
    // MARK: - Dependencies
    var presenter: ILandmarksPresenter
    var provider: ILandmarksDataProvider
    
    // MARK: - Initialization
    init(presenter: ILandmarksPresenter, provider: ILandmarksDataProvider) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: - Public
    public func getData() {
        provider.getDataFromJSON { result in
            presenter.interactorDidFetchUsers(with: result)
        }
    }
}
