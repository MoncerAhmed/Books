//
//  OptionalExtensions.swift
//  Books
//
//  Created by Ahmed Moncer on 03/09/2024.
//

import UIKit

/// Extension of Optional. Adds following capability to String; Null/Nil handling in an elegant way.
extension Swift.Optional where Wrapped == String {
    public var orEmptyString: String {
        if let unwrappedString = self {
            return unwrappedString
        }
        return ""
    }

    public var isNullOrEmpty: Bool {
        if self == Optional.none {
            return true
        }
        if let value = self {
            return value.isEmpty
        }
        return false
    }

    public var isNotNullOrEmpty: Bool {
        !isNullOrEmpty
    }

    public func or(_ text: String) -> String {
        guard let str = self else {
            return text
        }
        return str
    }

    public func or(optionalString: String?) -> String? {
        guard let str = self else {
            return optionalString
        }
        return str
    }

}

/// Extension of Optional. Adds following capability to Double; Null/Nil handling in an elegant way.
extension Swift.Optional where Wrapped == Double {
    public var orZero: Double {
        if let unwrappedDouble = self {
            return unwrappedDouble
        }
        return 0
    }

    public func or(_ value: Double) -> Double {
        guard let dbl = self else {
            return value
        }
        return dbl
    }
}


/// Extension of Optional. Adds following capability to Int; Null/Nil handling in an elegant way.
extension Swift.Optional where Wrapped == Int {
    public var orZero: Int {
        if let unwrappedInt = self {
            return unwrappedInt
        }
        return 0
    }
}

/// Extension of Optional. Adds following capability to Bool; Null/Nil handling in an elegant way.
extension Swift.Optional where Wrapped == Bool {
    public var orFalse: Bool {
        if let unwrappedBool = self {
            return unwrappedBool
        }
        return false
    }

    public var orTrue: Bool {
        if let unwrappedBool = self {
            return unwrappedBool
        }
        return true
    }
}


extension UIView {

    func dropShadow() {
        var shadowLayer: CAShapeLayer!
        let cornerRadius: CGFloat = 16.0
        let fillColor: UIColor = .black

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = fillColor.cgColor
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: -2.0, height: 2.0)
            shadowLayer.shadowOpacity = 5
            shadowLayer.shadowRadius = 5

            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
