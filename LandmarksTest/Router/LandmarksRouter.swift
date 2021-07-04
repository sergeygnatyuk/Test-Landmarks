import UIKit

typealias EntryPoint = ILandmarksView & UIViewController
class LandmarksRouter: ILandmarksRouter {
    var entry: EntryPoint?
    
    static func start() -> ILandmarksRouter {
        let router = LandmarksRouter()
        let view: ILandmarksView = LandmarksViewController()
        var presenter: ILandmarksPresenter = LandmarksPresenter()
        var interector: ILandmarksInteractor = LandmarksInteractor ()
        view.presenter = presenter
        interector.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interector
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
}
