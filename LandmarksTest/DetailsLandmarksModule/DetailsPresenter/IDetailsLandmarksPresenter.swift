import Foundation

protocol IDetailsLandmarksPresenter: AnyObject {

    // MARK: - Properties
    var view: IDetailsLandmarksView? { get set }
    
    
    func interactorDidFetchUsers(with result: Result<[Landmarks], Error>)
}

