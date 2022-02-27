import UIKit

final class DetailLandmarksViewController: UIViewController {
    
    // MARK: - Properties
    var landmarkModel: LandmarksModel?
    let landmarkDetail = [LandmarksModel]()
    var interactor: IDetailsLandmarksInteractor
    var detailView: DetailView = {
        let detailView = DetailView()
        return detailView
    }()
    
    // MARK: - Initialization
    init(interactor: IDetailsLandmarksInteractor) {
        self.interactor = interactor
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
        guard let selected = landmarkModel else { return }
        interactor.getData(forLandmark: selected)
        view.backgroundColor = UIColor().colorFromHex(Colors.white.rawValue)
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        detailView.imageView.layer.cornerRadius = detailView.imageView.frame.height / Size.two.rawValue
    }
}


