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
    
    lazy var shadowView: UIView = {
        let shadowView = UIView()
        return shadowView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 28)
        nameLabel.adjustsFontSizeToFitWidth = false
        return nameLabel
    }()
    
    lazy var parkLabel: UILabel = {
        let parkLabel = UILabel()
        parkLabel.numberOfLines = 0
        parkLabel.font = UIFont.systemFont(ofSize: 17)
        parkLabel.adjustsFontSizeToFitWidth = false
        return parkLabel
    }()
    
    lazy var stateLabel: UILabel = {
        let stateLabel = UILabel()
        stateLabel.numberOfLines = 0
        stateLabel.text = "Favorites only"
        stateLabel.font = UIFont.systemFont(ofSize: 15)
        stateLabel.adjustsFontSizeToFitWidth = false
        return stateLabel
    }()
    
    lazy var starLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.numberOfLines = 0
        starLabel.text = "⭐️"
        starLabel.adjustsFontSizeToFitWidth = false
        return starLabel
    }()

    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor().colorFromHex(Color.white.rawValue).cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.applyShadowWithCorner(containerView: shadowView, cornerRadious: 130)
    }
    
    // MARK: - Public
    public func setupUIElements() {
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
            make.width.equalTo(414)
            make.height.equalTo(370)
        }
        
        shadowView.snp.makeConstraints { make in
            make.size.equalTo(260)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(370)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(shadowView.snp.bottom).offset(10)
            make.leading.equalTo(13)
        }
        
        parkLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(1)
            make.leading.equalTo(13)
            make.width.equalTo(260)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(shadowView.snp.bottom).offset(11)
            make.centerY.equalTo(nameLabel).offset(27)
            make.trailing.equalTo(0).inset(13)
        }
        
        starLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel)
            make.trailing.greaterThanOrEqualToSuperview().offset(32)
            make.leading.equalTo(nameLabel.snp.trailing).offset(4)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(260)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(370)
        }
    }
    
    public func checkIsFavorite(isFavorite: Bool) {
         starLabel.isHidden = !isFavorite
     }
}
