import UIKit

protocol ILandmarksView: AnyObject {
    
    // MARK: - Properties
    var interactor: ILandmarksInteractor { get set }
    
    func updateUI(with viewModel: [Landmarks])
    
    func update(with error: String)
}
