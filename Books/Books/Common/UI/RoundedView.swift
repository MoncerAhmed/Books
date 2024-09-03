//
//  RoundedView.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import Foundation
import UIKit

@IBDesignable
class RoundedView: UIView {
    /// Corner radius of the view, using `UIBezierPath` to get a smoother curvature.
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadiusValue }
        set {
            cornerRadiusValue = newValue
            setNeedsLayout()
        }
    }

    @IBInspectable public var topLeft: Bool {
        get { return corners.contains(.topLeft) }
        set { set(newValue, corner: .topLeft) }
    }

    @IBInspectable public var topRight: Bool {
        get { return corners.contains(.topRight) }
        set { set(newValue, corner: .topRight) }
    }

    @IBInspectable public var bottomLeft: Bool {
        get { return corners.contains(.bottomLeft) }
        set { set(newValue, corner: .bottomLeft) }
    }

    @IBInspectable public var bottomRight: Bool {
        get { return corners.contains(.bottomRight) }
        set { set(newValue, corner: .bottomRight) }
    }

    // MARK: - Variables

    /// The class of the base layer inside the button's view.
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    /// Internal utility to retrieve the base layer as a shape layer without casting it everytime.
    private let shapeLayer = CAShapeLayer()


    var bezierPath: UIBezierPath {
        return UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: cornerRadius,
                height: cornerRadius)
        )
    }
    var corners: UIRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
    var cornerRadiusValue:CGFloat = 15

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    private func setup() {
        layer.insertSublayer(shapeLayer, at: 0)
        layer.masksToBounds = true
        clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.shadowPath = bezierPath.cgPath
        layer.mask = shapeLayer
    }

    func set(_ newValue: Bool, corner: UIRectCorner) {
        if newValue { corners.insert(corner) }
        else { corners.remove(corner) }
    }
}

