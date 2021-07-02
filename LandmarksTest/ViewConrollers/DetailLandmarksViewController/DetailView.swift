import UIKit
import SnapKit
import MapKit

final class DetailView: UIView {
    var landmark: Landmark?
    // MARK: - UI
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        return mapView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor().colorFromHex(Color.white.rawValue).cgColor
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 4
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.text = "Favorites only"
        nameLabel.font = UIFont.systemFont(ofSize: 28)
        nameLabel.adjustsFontSizeToFitWidth = false
//        nameLabel.textColor = .black
        return nameLabel
    }()
    
    
    // MARK: - Public
    public func setupUIElements() {
        addSubview(mapView)
        addSubview(imageView)
        addSubview(nameLabel)
    }
    
    public func setupConstraints() {
        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(414)
            make.height.equalTo(370)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(260)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(370)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.equalTo(13)
        }
    }
    
    //    public func setup(with model: Landmark) {
    //        imageView.image = ImageStore.shared.image(name: landmark?.imageName ?? "chilkoottrail")
    //    }
}
