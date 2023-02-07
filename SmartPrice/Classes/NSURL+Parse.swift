//
// Created by kennen on 2023/2/7.
//

import Foundation

extension String {
    /**
     转化为NSURLComponents
     - Returns: 结果
     */
    private func urlComponents() -> NSURLComponents? {
        guard let url = URL(string: self) else {
            return nil
        }
        return NSURLComponents(url: url, resolvingAgainstBaseURL: true)
    }

    /**
     去除query的URL
     - Returns: 结果
     */
    public func urlWithoutQuery() -> String? {
        let components = urlComponents()
        components?.query = nil
        return components?.url?.absoluteString
    }

    /**
     将query转化为字典
     - Returns: 结果
     */
    public func queryDictionary() -> [String: Any?]? {
        var dictionary: [String: Any?] = [:]
        let components = urlComponents()
        components?.queryItems?.forEach { item in
            var key = item.name.description
            let value = item.value?.description
            if key.hasSuffix("[]") {
                key = key.replacingOccurrences(of: "[]", with: "")
                if (!dictionary.keys.contains(key)) {
                    dictionary[key] = []
                }
                var values: [String] = dictionary[key] as! [String]
                values.append(value ?? "")
                dictionary[key] = values
            } else {
                dictionary[key] = value
            }
        }
        return dictionary
    }
}