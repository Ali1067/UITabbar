//
//  ViewController.swift
//  sample tabbar
//
//  Created by Muhammad Ali on 01/08/2022.
//

import UIKit

class ViewController: ParentClass {

    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var howView: UIView!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var ordersView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ordersView.layer.cornerRadius = 5
        howView.layer.cornerRadius = 5
        contactView.layer.cornerRadius = 5
        aboutView.layer.cornerRadius = 5
        DispatchQueue.main.async {
                    self.addBottom()
        }
    }
//    override func viewDidAppear(_ animated: Bool) {
//        self.addBottom()
//
//    }

}




@IBDesignable
class MyTabBar: UITabBar {
    private var shapeLayer: CALayer?
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 0.1

        //The below 4 lines are for shadow above the bar. you can skip them if you do not want a shadow
        shapeLayer.shadowOffset = CGSize(width:0, height:0)
        shapeLayer.shadowRadius = 5
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.3
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
//        self.backgroundColor = .clear
    }
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    func createPath() -> CGPath {
        let height: CGFloat = 28.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0)) // the beginning of the trough
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
            for member in subviews.reversed() {
                let subPoint = member.convert(point, from: self)
                guard let result = member.hitTest(subPoint, with: event) else { continue }
                return result
            }
            return nil
        }
    
}
extension UIDevice {
    /// Returns `true` if the device has a notch
    var hasNotch: Bool {
//        guard #available(iOS 11.0, *), let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return false }
        
        guard #available(iOS 11.0, *), let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return false }
        
        
        return window.safeAreaInsets.top >= 44
    }
}
