import UIKit

final class LandmarksPresenter: ILandmarksPresenter {
    
    // MARK: - Properties
    var view: ILandmarksView?
    
    init() {
    }
    
    // MARK: - Public
    public func interactorDidFetchUsers(with result: Result<[Landmarks], Error>) {
        switch result {
        case .success(let landmarks):
            view?.updateUI(with: landmarks)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
        }
    }
}

final class ImageStore {
    
    // MARK: - Properties
    static var shared = ImageStore()
    
    // MARK: - Public
    public func image(name: String) -> UIImage {
        return UIImage(named: name) ?? UIImage()
    }
}

