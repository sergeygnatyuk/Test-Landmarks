import UIKit

final class LandmarksAssembly {
    
    // MARK: - Dependencies
    private lazy var  dataProvider = LandmarksDataProvider()
    
    // MARK: - Public
    func assemble() -> UIViewController {
        let presenter = LandmarksPresenter()
        let interactor = LandmarksInteractor(presenter: presenter, provider: dataProvider)
        let viewController = LandmarksViewController(interactor: interactor)
        presenter.view = viewController
        return viewController
    }
}
