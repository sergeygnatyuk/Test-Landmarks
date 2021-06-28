import Foundation
protocol ILandmarksInteractor {
    var presenter: ILandmarksPresenter? { get set }
    func getUser()
}
