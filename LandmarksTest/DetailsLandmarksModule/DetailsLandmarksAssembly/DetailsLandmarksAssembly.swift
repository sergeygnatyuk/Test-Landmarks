import UIKit

final class DetailsLandmarksAssembly: Any {
    
    // MARK: - Dependencies
    private lazy var  dataProvider = LandmarksDataProvider()
    
    // MARK: - Public
   public func assemble(with landmark: Landmarks) -> UIViewController {
        let presenter = DetailsLandmarksPresenter()
        let interactor = DetailsLandmarksInteractor(presenter: presenter)
        let viewController = DetailLandmarksViewController(interactor: interactor)
        viewController.landmark = landmark
        presenter.view = viewController
        return viewController
    }
}
