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
        nameLabel.numberOfLines = Int(Size.zero.rawValue)
        nameLabel.font = UIFont.systemFont(ofSize: Size.fontNameLabel.rawValue)
        nameLabel.adjustsFontSizeToFitWidth = false
        return nameLabel
    }()
    
    lazy var parkLabel: UILabel = {
        let parkLabel = UILabel()
        parkLabel.numberOfLines = Int(Size.zero.rawValue)
        parkLabel.font = UIFont.systemFont(ofSize: Size.fontParkLabel.rawValue)
        parkLabel.adjustsFontSizeToFitWidth = false
        return parkLabel
    }()
    
    lazy var stateLabel: UILabel = {
        let stateLabel = UILabel()
        stateLabel.numberOfLines = Int(Size.zero.rawValue)
        stateLabel.text = "Favorites only"
        stateLabel.font = UIFont.systemFont(ofSize: Size.fontStateLabel.rawValue)
        stateLabel.adjustsFontSizeToFitWidth = false
        return stateLabel
    }()
    
    lazy var starLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.numberOfLines = Int(Size.zero.rawValue)
        starLabel.text = "⭐️"
        starLabel.adjustsFontSizeToFitWidth = false
        return starLabel
    }()
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor().colorFromHex(Colors.white.rawValue).cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = Size.three.rawValue
        return imageView
    }()
    
    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.applyShadowWithCorner(containerView: shadowView, cornerRadious: shadowView.frame.height / Size.two.rawValue)
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
            make.width.equalTo(Size.mapViewWidth.rawValue)
            make.height.equalTo(Size.mapViewHeight.rawValue)
        }
        
        shadowView.snp.makeConstraints { make in
            make.size.equalTo(Size.shadowViewSize.rawValue)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(Size.mapViewHeight.rawValue)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(shadowView.snp.bottom).offset(10)
            make.leading.equalTo(Size.nameLabelLeading.rawValue)
        }
        
        parkLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(Size.one.rawValue)
            make.leading.equalTo(Size.nameLabelLeading.rawValue)
            make.width.equalTo(Size.shadowViewSize.rawValue)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(shadowView.snp.bottom).offset(Size.starLabelTop.rawValue)
            make.centerY.equalTo(nameLabel).offset(Size.stateLabelCenterY.rawValue)
            make.trailing.equalTo(Size.zero.rawValue).inset(Size.nameLabelLeading.rawValue)
        }
        
        starLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nameLabel)
            make.trailing.greaterThanOrEqualToSuperview().offset(Size.starLabelTrailing.rawValue)
            make.leading.equalTo(nameLabel.snp.trailing).offset(Size.four.rawValue)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(Size.shadowViewSize.rawValue)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(Size.mapViewHeight.rawValue)
        }
    }
    
    public func checkIsFavorite(isFavorite: Bool) {
        starLabel.isHidden = !isFavorite
    }
}
