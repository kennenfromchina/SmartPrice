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
        // init string
        var origin = toPrice(decimalLength: decimalLength, smartFlag: smartFlag)
        origin = "\(symbol)\(origin)"

        // init attributes dictionary
        var rangeDictionary: [NSRange: [NSAttributedString.Key: Any]] = [:]

        // add total range attributes
        if let range = origin.range(of: origin) {
            let key = NSRange(range, in: origin)
            rangeDictionary[key] = [
                NSAttributedString.Key.foregroundColor: color,
                NSAttributedString.Key.font: integerFont,
            ]
        }

        // add symbol range attributes
        if symbol.isNotEmpty {
            let key = NSRange(origin.range(of: symbol)!, in: origin)
            rangeDictionary[key] = [
                NSAttributedString.Key.font: symbolFont
            ]
        }

        // add decimal range attributes
        if origin.contains(".") {
            let key = NSRange(origin.range(of: String(origin[origin.firstIndex(of: ".")!...]))!, in: origin)
            rangeDictionary[key] = [
                NSAttributedString.Key.font: decimalFont
            ]
        }

        // init
        let result = NSMutableAttributedString(string: origin)

        // set attributes with range
        rangeDictionary.forEach { (key: NSRange, value: [NSAttributedString.Key: Any]) in
            result.addAttributes(value, range: key)
        }

        return result
    }
}
