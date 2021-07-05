import UIKit

protocol IDetailsLandmarksView: AnyObject {
    
    var interactor: IDetailsLandmarksInteractor { get set }
    
    func updateUI(with viewModel: [Landmarks])
    
    func update(with error: String)
}
