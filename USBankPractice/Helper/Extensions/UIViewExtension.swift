//
//  UIViewExtension.swift
//
//  Created by Pramod Kumar on 5/17/17.
//  Copyright © 2017 Pramod Kumar. All rights reserved.
//

import Foundation
import UIKit

// MARK: -  UIView

extension UIView {
    public var autoResizingActive: Bool {
        get {
            return self.translatesAutoresizingMaskIntoConstraints
        }
        set {
            self.translatesAutoresizingMaskIntoConstraints = autoResizingActive
            for view in self.subviews {
                view.autoResizingActive = autoResizingActive
            }
        }
    }
    
    public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
    }
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame = CGRect(x: value, y: self.y, width: self.width, height: self.height)
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.x, y: value, width: self.width, height: self.height)
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: value, height: self.height)
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: self.width, height: value)
        }
    }
    
    public var left: CGFloat {
        get {
            return self.x
        } set(value) {
            self.x = value
        }
    }
    
    public var right: CGFloat {
        get {
            return self.x + self.width
        } set(value) {
            self.x = value - self.width
        }
    }
    
    public var top: CGFloat {
        get {
            return self.y
        } set(value) {
            self.y = value
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.y + self.height
        } set(value) {
            self.y = value - self.height
        }
    }
    
    public var origin: CGPoint {
        get {
            return self.frame.origin
        } set(value) {
            self.frame = CGRect(origin: value, size: self.frame.size)
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        } set(value) {
            self.center.x = value
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        } set(value) {
            self.center.y = value
        }
    }
    
    public var size: CGSize {
        get {
            return self.frame.size
        } set(value) {
            self.frame = CGRect(origin: self.frame.origin, size: value)
        }
    }
    
    // MARK: - set round corners
    func roundCorners(radius: CGFloat, borderWidth: CGFloat = 0.0, borderColor: UIColor = .clear) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func roundTopCorners(cornerRadius: CGFloat) {
        self.clipsToBounds = true
        self.addShadow(cornerRadius: cornerRadius, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner], color: .clear, offset: .zero, opacity: 0.0, shadowRadius: 0.0)
    }
    
    func roundBottomCorners(cornerRadius: CGFloat) {
        self.clipsToBounds = true
        self.addShadow(cornerRadius: cornerRadius, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], color: .clear, offset: .zero, opacity: 0.0, shadowRadius: 0.0)
    }
    
    func addShadow(cornerRadius: CGFloat, maskedCorners: CACornerMask, color: UIColor, offset: CGSize, opacity: Float, shadowRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.maskedCorners = maskedCorners
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = shadowRadius
    }
 
    public func addGrayShadow(ofColor color: UIColor = UIColor.black, radius: CGFloat = 3, offset: CGSize = .zero, opacity: Float = 0.2, cornerRadius: CGFloat? = nil) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        if let r = cornerRadius {
            layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: r).cgPath
        }
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func addNoDataLable(_ withDataCount: Int, withMessage: String = "No Data Found", withFont: UIFont = UIFont.systemFont(ofSize: 18.0), textColor: UIColor = UIColor.lightGray) {
        self.removeNoDataLabel()
        
        if withDataCount <= 0 {
            let msgLabel = UILabel()
            msgLabel.frame = self.bounds
            msgLabel.text = withMessage.isEmpty ? "No Data Found" : withMessage
            msgLabel.textAlignment = NSTextAlignment.center
            msgLabel.tag = 862548
            msgLabel.font = withFont
            msgLabel.textColor = textColor
            msgLabel.numberOfLines = 0
            msgLabel.backgroundColor = UIColor.clear
            msgLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            self.addSubview(msgLabel)
            self.bringSubviewToFront(msgLabel)
        }
    }
    
    fileprivate func removeNoDataLabel() {
        if let msgLabel = self.viewWithTag(862548) {
            msgLabel.removeFromSuperview()
        }
    }
    
    // method to make a view circular
    func makeCircular(borderWidth: CGFloat = 0.0, borderColor: UIColor = .clear) {
        self.roundCorners(radius: self.frame.size.height / 2.0, borderWidth: borderWidth, borderColor: borderColor)
    }
    
    func drawDottedLine(color: UIColor = .lightGray, start p0: CGPoint, end p1: CGPoint) {
        _ = self.layer.sublayers?.filter({ $0.name == "DashedTopLine" }).map({ $0.removeFromSuperlayer() })
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "DashedTopLine"
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [3, 2] // 3 is the length of dash, 2 is length of the gap.
        
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
    func rotate(rotationAngle: CGFloat) {
        self.transform = CGAffineTransform(rotationAngle: rotationAngle)
        self.clipsToBounds = true
    }
    
    func rootSuperView() -> UIView? {
        var view = self
        while let parentView = view.superview {
            view = parentView
        }
        return view
    }
}

extension UIView {
    func removeDottedLine() {
        if let all = self.layer.sublayers {
            for lay in all {
                if let name = lay.name, name == "dottedLine" {
                    lay.removeFromSuperlayer()
                    break
                }
            }
        }
    }
    
    func makeDottedLine(dashLength: Int = 3, gapLength: Int = 2, dashColor: UIColor = .lightGray, isInCenter: Bool = false) {
        self.removeDottedLine()
        let shapeLayer = CAShapeLayer()
        shapeLayer.name = "dottedLine"
        shapeLayer.strokeColor = dashColor.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [dashLength, gapLength] as [NSNumber] // 3 is the length of dash, 2 is length of the gap.
        
        let path = CGMutablePath()
        
        let start = isInCenter ? CGPoint(x: self.bounds.minX, y: self.frame.size.height / 2) : CGPoint(x: self.bounds.minX, y: self.bounds.minY)
        let end = isInCenter ? CGPoint(x: self.bounds.maxX, y: self.frame.size.height / 2) : CGPoint(x: self.bounds.maxX, y: self.bounds.minY)
        path.addLines(between: [start, end])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
    func subView(withTag: Int) -> UIView? {
        return self.subviews.filter { $0.tag == withTag }.first
    }
}
