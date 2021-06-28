import UIKit

protocol ILandmarksView: AnyObject {
    var presenter: ILandmarksPresenter? { get set }
    func updateUI(with viewModel: Landmark)
    
    func update(with error: String)
}
