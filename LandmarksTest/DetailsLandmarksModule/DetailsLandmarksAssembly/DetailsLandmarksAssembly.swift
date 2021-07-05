import UIKit

final class DetailsLandmarksAssembly: Any {
    
    // MARK: - Dependencies
    private lazy var  dataProvider = LandmarksDataProvider()
    
    // MARK: - Public
    func assemble() -> UIViewController {
        let presenter = DetailsLandmarksPresenter()
        let router = LandmarksRouter()
        let interactor = DetailsLandmarksInteractor(presenter: presenter, provider: dataProvider as! IDetailsLandmarksDataProvider)
        let viewController = DetailLandmarksViewController(interactor: interactor as! DetailedLandmarkBusinessLogic)
        presenter.view = viewController as? IDetailsLandmarksView
        router.transitionHandler = viewController
        return viewController
    }
}
