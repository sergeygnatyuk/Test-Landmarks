import UIKit

class DetailLandmarksViewController: UIViewController {
    
    // MARK: - Properties
    var landmark: Landmarks?
    let landmarkDetail = [Landmarks]()
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
        view.backgroundColor = UIColor().colorFromHex(Colors.white.rawValue)
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
        detailView.addSubviews()
        detailView.setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.imageView.layer.cornerRadius = detailView.imageView.frame.height / MyConstants.two.rawValue
    }
}
