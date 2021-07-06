import UIKit

protocol ILandmarksView: AnyObject {
    
    // MARK: - Properties
    var interactor: ILandmarksInteractor { get set }
    
    // MARK: - Methods
    func updateUI(with viewModel: [Landmarks])
    
    func update(with error: String)
}
