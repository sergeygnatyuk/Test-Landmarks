import UIKit

class DetailLandmarksViewController: UIViewController {
    
    // MARK: - Properties
    var landmark: Landmarks?
    let landmarkDetail = [Landmarks]()
    var state: DetailedLandmark.ViewControllerState
    let interactor: DetailedLandmarkBusinessLogic
    var detailView: DetailView = {
        let detailView = DetailView()
        return detailView
    }()
    
    init(interactor: DetailedLandmarkBusinessLogic, initialState: DetailedLandmark.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
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
