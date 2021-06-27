import Foundation

final class LandmarksRouter: ILandmarksRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - Public
    func showDetailsScreen() {
        let viewController = UIViewController()
        transitionHandler?.present(viewController, animated: true)
    }
    
}
