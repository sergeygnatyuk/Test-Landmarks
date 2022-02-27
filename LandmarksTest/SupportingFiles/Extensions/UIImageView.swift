  import UIKit
  
extension UIImageView {

	func applyShadowWithCorner(containerView : UIView, cornerRadius : CGFloat){
		containerView.clipsToBounds = false
		containerView.layer.shadowColor = UIColor.black.cgColor
		containerView.layer.shadowOpacity = 0.3
		containerView.layer.shadowOffset = CGSize.zero
		containerView.layer.shadowRadius = 10
		containerView.layer.cornerRadius = cornerRadius
		containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadius).cgPath
		self.clipsToBounds = true
		self.layer.cornerRadius = cornerRadius
	}
}
