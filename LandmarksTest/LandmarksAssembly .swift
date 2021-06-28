//import UIKit
//
//final class LandmarksAssembly {
//    // Dependencies
//    private lazy var  dataProvider = DataProvider()
//    func assemble() -> UIViewController {
//        let presenter = LandmarksPresenter()
//        let router = LandmarksRouter()
//        let interactor = LandmarksInteractor(presenter: presenter, dataProvider: dataProvider)
//        let viewController = LandmarksViewController(interactor: interactor, router: router)
//        presenter.view = viewController
//        router.transitionHandler = viewController
//        return viewController
//    }
//    
//    // MARK: - Public
//}
