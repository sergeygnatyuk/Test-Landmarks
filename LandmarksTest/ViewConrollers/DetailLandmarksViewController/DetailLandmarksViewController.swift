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
        view.backgroundColor = UIColor().colorFromHex(Color.white.rawValue)
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
        detailView.setupUIElements()
        detailView.setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.imageView.layer.cornerRadius = detailView.imageView.frame.height/2
    }
}
