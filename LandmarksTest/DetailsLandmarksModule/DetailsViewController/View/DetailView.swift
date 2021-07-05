import UIKit
import SnapKit
import MapKit

final class DetailView: UIView {
    
    // MARK: - Properties
    var landmark: Landmarks?
    
    // MARK: - UI
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        return mapView
    }()
    
    lazy var shadowView: UIView = {
        let shadowView = UIView()
        return shadowView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = Int(MyConstants.zero.rawValue)
        nameLabel.font = UIFont.systemFont(ofSize: MyConstants.fontNameLabel.rawValue)
        nameLabel.adjustsFontSizeToFitWidth = false
        return nameLabel
    }()
    
    lazy var parkLabel: UILabel = {
        let parkLabel = UILabel()
        parkLabel.numberOfLines = Int(MyConstants.zero.rawValue)
        parkLabel.font = UIFont.systemFont(ofSize: MyConstants.fontParkLabel.rawValue)
        parkLabel.adjustsFontSizeToFitWidth = false
        return parkLabel
    }()
    
    lazy var stateLabel: UILabel = {
        let stateLabel = UILabel()
        stateLabel.numberOfLines = Int(MyConstants.zero.rawValue)
        stateLabel.text = "Favorites only"
        stateLabel.font = UIFont.systemFont(ofSize: MyConstants.fontStateLabel.rawValue)
        stateLabel.adjustsFontSizeToFitWidth = false
        return stateLabel
    }()
    
    lazy var starLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.numberOfLines = Int(MyConstants.zero.rawValue)
        starLabel.text = "⭐️"
        starLabel.adjustsFontSizeToFitWidth = false
        return starLabel
    }()
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor().colorFromHex(Colors.white.rawValue).cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = MyConstants.three.rawValue
        return imageView
    }()
    
    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.applyShadowWithCorner(containerView: shadowView, cornerRadious: shadowView.frame.height / MyConstants.two.rawValue)
    }
    
    // MARK: - Public
    public func addSubviews() {
        addSubview(mapView)
        addSubview(shadowView)
        addSubview(nameLabel)
        addSubview(imageView)
        addSubview(parkLabel)
        addSubview(stateLabel)
        addSubview(starLabel)
    }
    
    public func setupConstraints() {
        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(MyConstants.mapViewWidth.rawValue)
            make.height.equalTo(MyConstants.mapViewHeight.rawValue)
        }
        
        shadowView.snp.makeConstraints { make in
            make.size.equalTo(MyConstants.shadowViewSize.rawValue)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(MyConstants.mapViewHeight.rawValue)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(shadowView.snp.bottom).offset(10)
            make.leading.equalTo(MyConstants.nameLabelLeading.rawValue)
        }
        
        parkLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(MyConstants.one.rawValue)
            make.leading.equalTo(MyConstants.nameLabelLeading.rawValue)
            make.width.equalTo(MyConstants.shadowViewSize.rawValue)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(shadowView.snp.bottom).offset(MyConstants.starLabelTop.rawValue)
            make.centerY.equalTo(nameLabel).offset(MyConstants.stateLabelCenterY.rawValue)
            make.trailing.equalTo(MyConstants.zero.rawValue).inset(MyConstants.nameLabelLeading.rawValue)
        }
        
        starLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel)
            make.trailing.greaterThanOrEqualToSuperview().offset(MyConstants.starLabelTrailing.rawValue)
            make.leading.equalTo(nameLabel.snp.trailing).offset(MyConstants.four.rawValue)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(MyConstants.shadowViewSize.rawValue)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(MyConstants.mapViewHeight.rawValue)
        }
    }
    
    public func checkIsFavorite(isFavorite: Bool) {
        starLabel.isHidden = !isFavorite
    }
    
    func parseData(state: Landmarks, controller: DetailLandmarksViewController) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: state.locationCoordinate , span: span)
        imageView.image = ImageStore.shared.image(name: state.imageName)
        checkIsFavorite(isFavorite: state.isFavorite )
        mapView.setRegion(region, animated: true)
        nameLabel.text = state.name
        parkLabel.text = state.park
        stateLabel.text = state.state
        controller.title = state.name
    }
    
}
