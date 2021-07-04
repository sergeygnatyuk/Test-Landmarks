import Foundation

class LandmarksPresenter: ILandmarksPresenter {
    var router: ILandmarksRouter?
    var interactor: ILandmarksInteractor?
    var view: ILandmarksView?
    init() {
        interactor?.getUser()
    }
    func interactorDidFetchUsers(with result: Result<[Landmark], Error>) {
    }
}

