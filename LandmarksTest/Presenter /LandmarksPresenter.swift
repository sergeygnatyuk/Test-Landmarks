import Foundation

final class LandmarksPresenter: ILandmarksPresenter {
    // Dependencies
    weak var view: ILandmarksView?
    
    // MARK: - Public
    func makeViewModels(with location: Location) {
        let viewModel = LandMarksViewController.Model.init(nameLabelText: location.name)
        view?.updateUI(with: viewModel)
    }
}
