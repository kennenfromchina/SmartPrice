//
// Created by kennen on 2022/3/12.
//

import Foundation
import UIKit

extension String {
    var isEmpty: Bool {
        count == 0
    }

    var isNotEmpty: Bool {
        !isEmpty
    }
}

extension Double {
    var isInteger: Bool {
        floor(self) == self
    }

    public func toPrice(
            decimalLength: Int = 2,
            smartFlag: Bool = true
    ) -> String {
        if smartFlag {
            if isInteger {
                return String(format: "%.0f", self)
            }
        }
        let temp = pow(10.0, Double(decimalLength))
        let result = (self * temp).rounded() / temp
        return String(format: "%.\(decimalLength)f", result)
    }

    public func toDisplayPrice(
            decimalLength: Int = 2,
            smartFlag: Bool = true,
            color: UIColor = .red,
            symbol: String = "¥",
            symbolFont: UIFont = .systemFont(ofSize: 14),
            integerFont: UIFont = .systemFont(ofSize: 18),
            decimalFont: UIFont = .systemFont(ofSize: 14)
    ) -> NSAttributedString {
        var origin = toPrice(decimalLength: decimalLength, smartFlag: smartFlag)
        origin = "\(symbol)\(origin)"

        var symbolRange: NSRange?
        var decimalRange: NSRange?

        if symbol.isNotEmpty {
            symbolRange = (origin as NSString).range(of: symbol)
        }

        if origin.contains(".") {
            decimalRange = (origin as NSString).range(of: String(origin[origin.firstIndex(of: ".")!...]))
        }

        let attributes = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font: integerFont,
        ]

        let result: NSMutableAttributedString = NSMutableAttributedString(string: origin, attributes: attributes)

        if let range = symbolRange {
            result.addAttribute(NSAttributedString.Key.font, value: symbolFont, range: range)
        }

        if let range = decimalRange {
            result.addAttribute(NSAttributedString.Key.font, value: decimalFont, range: range)
        }

        return result
    }
}
