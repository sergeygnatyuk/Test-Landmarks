import Foundation

final class LandmarksAssembly {
    // Dependencies
    private lazy var  dataProvider = DataProvider()
    
    func assemble() -> UIviewController {
        let presenter = LandmarksPresenter()
        let router = LandmarksRouter()
        let interactor = LandmarksInteractor(presenter: presenter, dataProvider: dataProvider)
        let viewController = LandMarksViewController(interactor: interactor, router: router)
        presenter.view = viewController
        router.transitionHandler = viewController
        return viewController
    }
    
    // MARK: - Public
}
