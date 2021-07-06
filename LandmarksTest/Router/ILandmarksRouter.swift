import UIKit

protocol ILandmarksRouter {
    func showDetailsScreen(for landmark: Landmarks)
    func start() -> UIViewController
}
