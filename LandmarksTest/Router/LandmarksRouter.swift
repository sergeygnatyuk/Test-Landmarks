import UIKit

protocol ILandmarksRouter {
	func showDetailsScreen(landmark: LandmarksModel)
	func start() -> UIViewController
}

final class LandmarksRouter: ILandmarksRouter {
    
    //MARK: - Dependencies
    weak var transitionHandler: UINavigationController?
    
    // MARK: - Public
    public func showDetailsScreen(landmark: LandmarksModel) {
        let viewController = DetailsLandmarksAssembly().assemble(with: landmark)
        transitionHandler?.pushViewController(viewController, animated: true)
    }
    
    public func start() -> UIViewController {
        let assembly = LandmarksAssembly()
        let viewController = assembly.assemble()
        return viewController
    }
}
