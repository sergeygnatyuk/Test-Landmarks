import UIKit

protocol IDetailsLandmarksView: AnyObject {
    
    // MARK: - Properties
    var interactor1: IDetailsLandmarksInteractor { get set }
    
    func updateUI(with viewModel: [Landmarks])
    
    func update(with error: String)
}
