import UIKit

final class DetailsLandmarksAssembly: Any {
    
    // MARK: - Dependencies
    private lazy var  dataProvider = LandmarksDataProvider()
    
    // MARK: - Public
   public func assemble(with landmark: LandmarksModel) -> UIViewController {
        let presenter = DetailsLandmarksPresenter()
        let interactor = DetailsLandmarksInteractor(presenter: presenter)
        let viewController = DetailLandmarksViewController(interactor: interactor)
        viewController.landmarkModel = landmark
        presenter.view = viewController
        return viewController
    }
}
