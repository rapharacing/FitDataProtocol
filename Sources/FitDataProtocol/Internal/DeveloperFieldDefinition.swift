//
//  DeveloperFieldDefinition.swift
//  FitDataProtocol
//
//  Created by Kevin Hoogheem on 1/21/18.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import DataDecoder

internal struct DeveloperFieldDefinition {

    private(set) var fieldNumber: UInt8

    private(set) var size: UInt8

    private(set) var dataIndex: UInt8
}

internal extension DeveloperFieldDefinition {

    internal static func decode(decoder: inout DataDecoder) throws -> DeveloperFieldDefinition {

        let fieldNumber = decoder.decodeUInt8()
        let size = decoder.decodeUInt8()
        let dataIndex = decoder.decodeUInt8()

        return DeveloperFieldDefinition(fieldNumber: fieldNumber,
                                        size: size,
                                        dataIndex: dataIndex)
    }

}
