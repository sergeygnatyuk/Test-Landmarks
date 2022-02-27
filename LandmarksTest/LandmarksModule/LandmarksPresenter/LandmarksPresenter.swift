import UIKit

final class LandmarksPresenter: ILandmarksPresenter {
    
    // MARK: - Properties
    var view: ILandmarksView?

    // MARK: - Public
    public func interactorDidFetchUsers(with result: Result<[LandmarksModel], Error>) {
        switch result {
        case .success(let landmarks):
            view?.updateUI(with: landmarks)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
}

