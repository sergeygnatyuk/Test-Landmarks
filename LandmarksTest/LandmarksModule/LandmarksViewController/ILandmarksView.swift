import UIKit

protocol ILandmarksView: AnyObject {
    
    // MARK: - Properties
    var interactor: ILandmarksInteractor { get set }
    
    // MARK: - Methods
    func updateUI(with viewModel: [LandmarksModel])
    
    func update(with error: String)
}
