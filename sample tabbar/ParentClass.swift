//
//  ParentClass.swift
//  sample tabbar
//
//  Created by Muhammad Ali on 02/08/2022.
//

import Foundation
import UIKit
class ParentClass: UIViewController{
    

    func addBottom() {
        let button = UIButton()
        if UIDevice.current.hasNotch {
//            Loggs.loggs("Has notch")
            button.frame = CGRect(x: (self.view.frame.size.width-50) / 2, y: self.view.frame.size.height - 110, width: 50, height: 50)
        } else {
//            Loggs.loggs("not notch")
            button.frame = CGRect(x: (self.view.frame.size.width-50) / 2, y: self.view.frame.size.height - 75, width: 50, height: 50)
        }
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "add_new_order"), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }

    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
}
