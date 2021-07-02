import UIKit

class DetailLandmarksViewController: UIViewController {
    // MARK: - Properties
    var landmark: Landmark?
    let landmarkDetail = landmarkData
    var detailView: DetailView = {
        let detailView = DetailView()
        return detailView
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //          detailView.frame = view.bounds
        view.backgroundColor = UIColor().colorFromHex(Color.white.rawValue)
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
      //  title = landmark?.name
      //  detailView.imageView.image = ImageStore.shared.image(name: landmark!.imageName)
        //        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        //        let region = MKCoordinateRegion(center: landmark!.locationCoordinate, span: span)
        //        mapView.setRegion(region, animated: true)
        detailView.setupUIElements()
        detailView.setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.imageView.layer.cornerRadius = detailView.imageView.frame.height/2
    }
}
