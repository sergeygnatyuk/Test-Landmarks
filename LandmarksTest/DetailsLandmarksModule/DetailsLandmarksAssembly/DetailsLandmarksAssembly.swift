import UIKit

final class DetailsLandmarksAssembly: Any {
    
    // MARK: - Dependencies
    private lazy var  dataProvider = LandmarksDataProvider()
    
    // MARK: - Public
    func assemble(with landmark: Landmarks) -> UIViewController {
        let presenter = DetailsLandmarksPresenter()
       // let router = LandmarksRouter()
        let interactor = DetailsLandmarksInteractor(presenter: presenter)
        let viewController = DetailLandmarksViewController(interactor: interactor)
        viewController.landmark = landmark
        presenter.view = viewController as? IDetailsLandmarksView
      //  router.transitionHandler = viewController
        return viewController
    }
}
