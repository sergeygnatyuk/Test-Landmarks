import Foundation

extension DetailLandmarksViewController: DetailedLandmarkLogic {
    func displayLandmark(viewModel: DetailedLandmark.GetDetailsCase.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: DetailedLandmark.ViewControllerState) {
        state = newState
        switch state {
        case .loading:
            print("loading...")
        case let .error(message):
            print("error \(message)")
        case let .result(items):
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.isHidden = false
            title = items.name
            detailView.parseData(state: items, controller: DetailLandmarksViewController(interactor: DetailedLandmarkBusinessLogic.self as! DetailedLandmarkBusinessLogic))
        case .emptyResult:
            print("empty result")
        }
    }
}
