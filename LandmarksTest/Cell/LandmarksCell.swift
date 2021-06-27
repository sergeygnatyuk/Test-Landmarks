
import UIKit
import SnapKit

final class LandmarksCell: UITableViewCell {
    
    // MARK: - UI
    private lazy var landmarksImageView: UIImageView = {
        let landmarksImageView = UIImageView()
        landmarksImageView.layer.cornerRadius = frame.height / 2
        landmarksImageView.contentMode = .scaleToFill
        landmarksImageView.layer.borderWidth = 4
        landmarksImageView.translatesAutoresizingMaskIntoConstraints = false
        return landmarksImageView
    }()
    
    private lazy var starImageView: UIImageView = {
        let starImageView = UIImageView()
        return starImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
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
        //      addSubview(titleLabel)
        //        addSubview(starImageView)
        setupLayout()
        shadowImageView
    }
    
    private func setupLayout() {
        //        titleLabel.snp.makeConstraints { maker in
        //            maker.edges.equalToSuperview()
        //        }
        landmarksImageView.snp.makeConstraints { maker in
            maker.top.trailing.equalToSuperview().inset(MyConstants.imageTrailing.rawValue)
            maker.width.height.equalTo(MyConstants.imageSize.rawValue)
        }
    }
    
    private func checkIsFavorite(isFavorite: Bool) {
        if isFavorite == true {
            titleLabel.text? += "⭐️"
        }
    }
    
    private func shadowImageView() {
        landmarksImageView.clipsToBounds = false
        landmarksImageView.layer.masksToBounds = false
        landmarksImageView.layer.shadowColor = UIColor.black.cgColor
        landmarksImageView.layer.shadowRadius = 10
        landmarksImageView.layer.shadowOpacity = 0.33
        landmarksImageView.layer.shadowOffset = .zero
        landmarksImageView.layer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
    }
    
    private enum MyConstants: CGFloat {
        case `default` = 10
        case imageSize = 40
        case imageTrailing = 16
    }
}


