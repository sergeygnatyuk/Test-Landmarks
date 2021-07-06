import UIKit

final class LandmarksRouter: ILandmarksRouter {
    
    //MARK: - Dependencies
    weak var transitionHandler: UINavigationController?
    
    // MARK: - Public
    public func showDetailsScreen(for landmark: Landmarks) {
        let vc = DetailsLandmarksAssembly().assemble(with: landmark)
        transitionHandler?.pushViewController(vc, animated: true)
    }
    
    public func start() -> UIViewController {
        let assembly = LandmarksAssembly()
        let viewController = assembly.assemble()
        return viewController
    }
}
