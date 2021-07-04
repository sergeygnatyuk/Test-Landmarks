import Foundation

protocol ILandmarksPresenter {
    var router: ILandmarksRouter? { get set }
    var interactor: ILandmarksInteractor? { get set }
    var view: ILandmarksView? { get set}
    func interactorDidFetchUsers(with result: Result<[Landmark], Error>)
}

