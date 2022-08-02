//
//  ImageView.swift
//  sample tabbar
//
//  Created by Muhammad Ali on 02/08/2022.
//

import Foundation
import UIKit
class ImageViewExtension: UIImageView {

override public func layoutSubviews() {
    super.layoutSubviews()
    self.roundUpCorners([.bottomLeft, .bottomRight], radius: 30)
}
}
extension UIView {
func roundUpCorners(_ corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
}
}
