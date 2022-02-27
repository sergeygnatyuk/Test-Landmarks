import Foundation

protocol IDetailsLandmarksPresenter: AnyObject {

    // MARK: - Properties
    var view: IDetailsLandmarksView? { get set }
    
    // MARK: - Methods
    func prepareViewModel(for landmark: LandmarksModel)
}

