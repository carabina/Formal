//  RuleRange.swift
//  Formal (https://github.com/Meniny/Formal)
//
//  Copyright (c) 2016 Meniny (https://meniny.cn)
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

public struct RuleGreaterThan<F: Comparable>: RuleType {

    let min: F

    public var id: String?
    public var validationError: ValidationError

    public init(min: F, msg: String? = nil) {
        let ruleMsg = msg ?? "Field value must be greater than \(min)"
        self.min = min
        self.validationError = ValidationError(msg: ruleMsg)
    }

    public func isValid(value: F?) -> ValidationError? {
        guard let val = value else { return nil }
        guard val > min else { return validationError }
        return nil
    }
}

public struct RuleGreaterOrEqualThan<F: Comparable>: RuleType {

    let min: F

    public var id: String?
    public var validationError: ValidationError

    public init(min: F, msg: String? = nil) {
        let ruleMsg = msg ?? "Field value must be greater or equals than \(min)"
        self.min = min
        self.validationError = ValidationError(msg: ruleMsg)
    }

    public func isValid(value: F?) -> ValidationError? {
        guard let val = value else { return nil }
        guard val >= min else { return validationError }
        return nil
    }
}

public struct RuleSmallerThan<F: Comparable>: RuleType {

    let max: F

    public var id: String?
    public var validationError: ValidationError

    public init(max: F, msg: String? = nil) {
        let ruleMsg = msg ??  "Field value must be smaller than \(max)"
        self.max = max
        self.validationError = ValidationError(msg: ruleMsg)
    }

    public func isValid(value: F?) -> ValidationError? {
        guard let val = value else { return nil }
        guard val < max else { return validationError }
        return nil
    }
}

public struct RuleSmallerOrEqualThan<F: Comparable>: RuleType {

    let max: F

    public var id: String?
    public var validationError: ValidationError

    public init(max: F, msg: String? = nil) {
        let ruleMsg = msg ?? "Field value must be smaller or equals than \(max)"
        self.max = max
        self.validationError = ValidationError(msg: ruleMsg)
    }

    public func isValid(value: F?) -> ValidationError? {
        guard let val = value else { return nil }
        guard val <= max else { return validationError }
        return nil
    }
}