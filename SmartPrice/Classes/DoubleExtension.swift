//
// Created by kennen on 2022/3/12.
//

import Foundation

extension Double {
    var isInteger: Bool {
        self == Double(Int(self))
    }

    public func toPrice(decimalLength: Int = 2, smartFlag: Bool = true) -> String {
        if smartFlag {
            if isInteger {
                return String(format: "%.0f", self)
            }
        }
        return String(format: "%.\(decimalLength)f", self)
    }
}
