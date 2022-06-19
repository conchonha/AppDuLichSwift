//
//  extension.swift
//  AppDulichSwift
//
//  Created by Sang on 19/06/2022.
//

import Foundation
import UIKit

extension UIColor {

  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
      self.init("ff0000") // return red color for wrong hex input
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }
}

extension UITextField{
    /*
     userNameTextFiel.textColor = UIColor("#FD0A0A") // do
     userNameTextFiel.layer.borderColor = UIColor("#FFBB86FC").cgColor //tim
     userNameTextFiel.layer.borderWidth = 1.0;
     userNameTextFiel.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
     userNameTextFiel.backgroundColor = UIColor("#3F51B5") //xanh
     //padding -> dung transfrom di chuyen
     userNameTextFiel.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
     
     //radius
     userNameTextFiel.layer.cornerRadius = 20.0
     userNameTextFiel.layer.masksToBounds = true;
     */
    
    public func bgTextFileAuth(top : Float = 0){
        textColor = AppColor.h5E5E5E
        layer.borderColor = AppColor.colorPrimary.cgColor
        layer.borderWidth = 1.0
        layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        backgroundColor = AppColor.white
        layer.cornerRadius = 20.0
        layer.masksToBounds = true
        font = UIFont.init(name: (font?.fontName)!, size: 14.0)!
    }
    
    public func setLeftImage(image: String){
        let padding = 10.0
        let widthImage = 20.0
        let imageView = UIImageView(image: UIImage(named: image))
        
        imageView.frame = CGRect(x: padding, y: 0, width: widthImage, height: frame.height)
        imageView.contentMode = .center
               
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: widthImage + 2 * padding, height: frame.height))
        containerView.addSubview(imageView)
        leftView = containerView
        leftViewMode = .always
    }
    
}
