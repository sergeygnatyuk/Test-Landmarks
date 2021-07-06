import Foundation

extension DetailLandmarksViewController: IDetailsLandmarksView {
    
    // MARK: - Public
    public func updateUI(with viewModel: DetailedLandmarkViewModel) {
        detailView.imageView.image = viewModel.image
        detailView.checkIsFavorite(isFavorite: viewModel.isFavourite)
        detailView.mapView.setRegion(viewModel.region, animated: true)
        detailView.nameLabel.text = viewModel.name
        detailView.parkLabel.text = viewModel.parkName
        detailView.stateLabel.text = viewModel.state
        title = viewModel.name
    }
}
