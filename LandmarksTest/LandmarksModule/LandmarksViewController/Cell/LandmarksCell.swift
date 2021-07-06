import UIKit
import SnapKit

final class LandmarksCell: UITableViewCell {
    
    // MARK: - UI
    private lazy var cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        cellImageView.clipsToBounds = true
        cellImageView.isUserInteractionEnabled = true
        return cellImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = Int(Size.zero.rawValue)
        titleLabel.font = UIFont.systemFont(ofSize: Size.fontSizeLabels.rawValue)
        titleLabel.adjustsFontSizeToFitWidth = false
        return titleLabel
    }()
    
    private lazy var starLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.numberOfLines = Int(Size.zero.rawValue)
        starLabel.text = "⭐️"
        starLabel.adjustsFontSizeToFitWidth = false
        return starLabel
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    override func layoutSubviews() {
        super.layoutSubviews()
        cellImageView.layer.cornerRadius = cellImageView.frame.height / Size.two.rawValue
    }
    
    // MARK: - Private
    private func createSubviews() {
        contentView.addSubview(cellImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(starLabel)
    }
    
    private func setupConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Size.imageTrailing.rawValue)
            make.centerY.equalToSuperview()
            make.size.equalTo(Size.imageSize.rawValue)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(cellImageView.snp.trailing).offset(Size.eight.rawValue)
        }
        
        starLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.greaterThanOrEqualToSuperview().offset(Size.starLabelTrailing.rawValue)
            make.leading.equalTo(titleLabel.snp.trailing).offset(Size.two.rawValue)
        }
    }
    
    // MARK: - Public
    public func checkIsFavorite(isFavorite: Bool) {
        starLabel.isHidden = !isFavorite
    }
    
    public func setup(with model: Landmarks) {
        titleLabel.text = model.name
        cellImageView.image = ImageStore.shared.image(name: model.imageName)
    }
}


