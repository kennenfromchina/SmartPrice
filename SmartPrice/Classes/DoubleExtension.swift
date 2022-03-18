//
// Created by kennen on 2022/3/12.
//

import Foundation
import UIKit
import UIColor_Hex_Swift

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
            color: UIColor = UIColor("#E3330D"),
            symbol: String = "¥",
            symbolFont: UIFont = .systemFont(ofSize: 13),
            integerFont: UIFont = .systemFont(ofSize: 22, weight: .medium),
            decimalFont: UIFont = .systemFont(ofSize: 14)
    ) -> NSAttributedString {
        // init string
        var origin = toPrice(decimalLength: decimalLength, smartFlag: smartFlag)
        origin = "\(symbol)\(origin)"

        // init attributes array
        var rangeAttributesArray: [(NSRange, [NSAttributedString.Key: Any])] = []

        // add total range attributes
        if let total = origin.range(of: origin) {
            let range = NSRange(total, in: origin)
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: color,
                .font: integerFont,
            ]
            rangeAttributesArray.append((range, attributes))
        }

        // add symbol range attributes
        if symbol.isNotEmpty {
            let range = NSRange(origin.range(of: symbol)!, in: origin)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: symbolFont
            ]
            rangeAttributesArray.append((range, attributes))
        }

        // add decimal range attributes
        if origin.contains(".") {
            let range = NSRange(origin.range(of: String(origin[origin.firstIndex(of: ".")!...]))!, in: origin)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: decimalFont
            ]
            rangeAttributesArray.append((range, attributes))
        }

        // init
        let result = NSMutableAttributedString(string: origin)

        // set attributes with range
        rangeAttributesArray.forEach { (range: NSRange, attributes: [NSAttributedString.Key: Any]) in
            result.addAttributes(attributes, range: range)
        }

        return result
    }

    public func toOriginPrice(
            decimalLength: Int = 2,
            smartFlag: Bool = true,
            color: UIColor = UIColor("#999999"),
            symbol: String = "¥",
            originText: String = "原价:",
            font: UIFont = .systemFont(ofSize: 14)
    ) -> NSAttributedString {
        var origin = toPrice(decimalLength: decimalLength, smartFlag: smartFlag)
        origin = "\(originText)\(symbol)\(origin)"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: font,
            .strikethroughStyle: NSUnderlineStyle.thick.rawValue,
            .strikethroughColor: color,
            .baselineOffset: 0,
        ]
        return NSAttributedString(string: origin, attributes: attributes)
    }


}
