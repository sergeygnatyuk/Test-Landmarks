import Foundation

protocol IDetailsLandmarksPresenter: AnyObject {

    // MARK: - Properties
    var view: IDetailsLandmarksView? { get set }
    
    func prepareViewModel(for landmark: Landmarks)
}

