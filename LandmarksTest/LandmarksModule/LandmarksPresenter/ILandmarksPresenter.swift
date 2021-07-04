import Foundation

protocol ILandmarksPresenter {
    
    // MARK: - Properties
    var view: ILandmarksView? { get set }
    
    
    func interactorDidFetchUsers(with result: Result<[Landmarks], Error>)
}

