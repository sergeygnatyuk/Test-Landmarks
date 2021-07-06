import UIKit

protocol ILandmarksRouter {
    
    // MARK: - Methods
    func showDetailsScreen(for landmark: Landmarks)
    
    func start() -> UIViewController
}
