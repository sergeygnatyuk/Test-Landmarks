import Foundation

protocol ILandmarksPresenter {
    
    // MARK: - Properties
    var view: ILandmarksView? { get set }
    
    // MARK: - Methods
    func interactorDidFetchUsers(with result: Result<[LandmarksModel], Error>)
}

