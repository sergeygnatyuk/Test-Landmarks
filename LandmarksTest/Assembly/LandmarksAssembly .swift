import UIKit

final class LandmarksAssembly {
    
    // MARK: - Dependencies
    private lazy var  dataProvider = LandmarksDataProvider()
    
    // MARK: - Public
    func assemble() -> UIViewController {
        let presenter = LandmarksPresenter()
        let router = LandmarksRouter()
        let interactor = LandmarksInteractor(presenter: presenter, provider: dataProvider)
        let viewController = LandmarksViewController(interactor: interactor)
        presenter.view = viewController
        router.transitionHandler = viewController
        return viewController
    }
}
