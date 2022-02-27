import UIKit
import MapKit

final class DetailsLandmarksDataProvider: IDetailsLandmarksDataProvider {
    
    // MARK: - Public
    public func parseData(state: LandmarksModel, controller: DetailLandmarksViewController) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: state.locationCoordinate , span: span)
        controller.detailView.imageView.image = ImageStore.shared.image(name: state.imageName)
        controller.detailView.checkIsFavorite(isFavorite: state.isFavorite )
        controller.detailView.mapView.setRegion(region, animated: true)
        controller.detailView.nameLabel.text = state.name
        controller.detailView.parkLabel.text = state.park
        controller.detailView.stateLabel.text = state.state
        controller.title = state.name
    }
}


