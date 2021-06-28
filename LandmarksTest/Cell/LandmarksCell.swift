
import UIKit
import SnapKit

final class LandmarksCell: UITableViewCell {
    // MARK: - UI
    lazy var landmarksImageView: UIImageView = {
        let landmarksImageView = UIImageView()
        landmarksImageView.clipsToBounds = true
        landmarksImageView.translatesAutoresizingMaskIntoConstraints = false
        landmarksImageView.isUserInteractionEnabled = true
        return landmarksImageView
    }()
    
    
    private lazy var starImageView: UIImageView = {
        let starImageView = UIImageView()
        return starImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 19)
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUICell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    private func setupUICell() {
        addSubview(landmarksImageView)
        addSubview(titleLabel)
        //        addSubview(starImageView)
        setupLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        landmarksImageView.layer.cornerRadius = landmarksImageView.frame.height / 2
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.leading.equalTo(landmarksImageView).inset(MyConstants.default.rawValue + MyConstants.imageSize.rawValue)
        }
        
        landmarksImageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().inset(MyConstants.imageTrailing.rawValue)
            maker.centerY.equalToSuperview()
            maker.size.equalTo(MyConstants.imageSize.rawValue)
        }
    }
    
    private func checkIsFavorite(isFavorite: Bool) {
        if isFavorite == true {
            titleLabel.text? += "⭐️"
        }
    }
    
    private enum MyConstants: CGFloat {
        case `default` = 10
        case imageSize = 60
        case imageTrailing = 20
    }
}


