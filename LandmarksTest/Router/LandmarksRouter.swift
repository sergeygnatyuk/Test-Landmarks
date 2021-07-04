import UIKit

final class LandmarksRouter: ILandmarksRouter {
    func start() -> UIViewController {
        let assembly = LandmarksAssembly()
        let viewController = assembly.assemble()
        return viewController
    }
    
    //MARK: - Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - Public
   public func showDetailsScreen() {
        let viewController = DetailLandmarksViewController()
        transitionHandler?.present(viewController, animated: true)
    }
}
