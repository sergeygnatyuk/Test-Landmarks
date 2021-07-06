import UIKit

final class LandmarksRouter: ILandmarksRouter {
    func start() -> UIViewController {
        let assembly = LandmarksAssembly()
        let viewController = assembly.assemble()
        return viewController
    }
    
    //MARK: - Dependencies
    weak var transitionHandler: UINavigationController?
    
    // MARK: - Public
    public func showDetailsScreen(for landmark: Landmarks) {
    let vc = DetailsLandmarksAssembly().assemble(with: landmark)
    transitionHandler?.pushViewController(vc, animated: true)
//    guard let viewController = DetailLandmarksViewController(coder: NSCoder()) else { return }
//        transitionHandler?.present(viewController, animated: true)
    }
}
