import UIKit
import SnapKit
import MapKit

fileprivate extension Appearance {
	var stateText: String { "Favorites only" }
	var starText: String { "⭐️" }

	var imageBorderWidth: CGFloat { 3 }
	var halfHeight: CGFloat { 2 }
	var mapHeight: CGFloat { 370 }
	var imageSize: CGFloat { 260 }
	var nameTop: CGFloat { 10 }
	var nameLeading: CGFloat { 13 }
	var starLeading: CGFloat { 4 }
	var parkTrailing: CGFloat { 70 }
	var stateTrailing: CGFloat { 15 }

	var nameLabelFont: UIFont { .systemFont(ofSize: 28) }
	var parkLabelFont: UIFont { .systemFont(ofSize: 17) }
	var stateLabelFont: UIFont { .systemFont(ofSize: 15) }
}

final class DetailView: UIView {

	private let appearance = Appearance()
    
    // MARK: - UI
	let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = MKMapType.standard
        return mapView
    }()
    
	private let shadowView = UIView()
    
	lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
		nameLabel.font = appearance.nameLabelFont
        nameLabel.adjustsFontSizeToFitWidth = false
        return nameLabel
    }()
    
	lazy var parkLabel: UILabel = {
        let parkLabel = UILabel()
        parkLabel.numberOfLines = 0
		parkLabel.font = appearance.parkLabelFont
        parkLabel.adjustsFontSizeToFitWidth = false
        return parkLabel
    }()
    
	lazy var stateLabel: UILabel = {
        let stateLabel = UILabel()
        stateLabel.numberOfLines = 0
		stateLabel.text = appearance.stateText
		stateLabel.font = appearance.stateLabelFont
        stateLabel.adjustsFontSizeToFitWidth = false
        return stateLabel
    }()
    
	lazy var starLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.numberOfLines = 0
		starLabel.text = appearance.starText
        starLabel.adjustsFontSizeToFitWidth = false
        return starLabel
    }()

	lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor().colorFromHex(Colors.white.rawValue).cgColor
        imageView.contentMode = .scaleAspectFit
		imageView.layer.borderWidth = appearance.imageBorderWidth
        return imageView
    }()

	// MARK: - Initialization
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
		imageView.applyShadowWithCorner(containerView: shadowView, cornerRadius: shadowView.frame.height / appearance.halfHeight)
		imageView.layer.cornerRadius = imageView.frame.height / Size.two.rawValue
    }
    
    // MARK: - Internal
	func checkIsFavorite(isFavorite: Bool) {
		starLabel.isHidden = !isFavorite
	}

	// MARK: - Private
    private func addSubviews() {
        addSubview(mapView)
        addSubview(shadowView)
        addSubview(nameLabel)
        addSubview(imageView)
        addSubview(parkLabel)
        addSubview(stateLabel)
        addSubview(starLabel)
    }
    
	private func setupConstraints() {
        mapView.snp.makeConstraints {
			$0.height.equalTo(appearance.mapHeight)
			$0.top.leading.trailing.equalToSuperview()
        }

		imageView.snp.makeConstraints {
			$0.size.equalTo(appearance.imageSize)
			$0.centerX.equalToSuperview()
			$0.centerY.equalTo(appearance.mapHeight)
		}

        shadowView.snp.makeConstraints {
			$0.size.equalTo(imageView.snp.size)
			$0.center.equalTo(imageView.snp.center)
        }
        
        nameLabel.snp.makeConstraints {
			$0.top.equalTo(shadowView.snp.bottom).offset(appearance.nameTop)
			$0.leading.equalToSuperview().inset(appearance.nameLeading)
        }

		starLabel.snp.makeConstraints {
			$0.centerY.equalTo(nameLabel)
			$0.leading.equalTo(nameLabel.snp.trailing).offset(appearance.starLeading)
		}
        
        parkLabel.snp.makeConstraints {
			$0.top.equalTo(nameLabel.snp.bottom)
			$0.leading.equalToSuperview().inset(appearance.nameLeading)
			$0.trailing.equalToSuperview().inset(appearance.parkTrailing)
        }
        
        stateLabel.snp.makeConstraints {
			$0.top.equalTo(parkLabel.snp.top)
			$0.trailing.equalToSuperview().inset(appearance.stateTrailing)
        }
    }

	private func configure() {
		addSubviews()
		setupConstraints()
	}
}
