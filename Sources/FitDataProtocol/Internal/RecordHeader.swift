//
//  RecordHeader.swift
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


internal struct RecordHeader {

    private(set) var localMessageType: UInt8

    private(set) var isDataMessage: Bool

    private(set) var developerData: Bool
}


internal extension RecordHeader {

    internal static func decode(decoder: inout DataDecoder) throws -> RecordHeader {

        let header = decoder.decodeUInt8()

        var isDataMessage = false
        var developerData = false
        var messageType: UInt8 = 0

        if (header & 0x80 == 0x80) {

            messageType = header & 0x60 >> 5

        } else {

            if (header & 0x40 == 0x40) {

                if header & 0x20 == 0x20 {
                    developerData = true
                }

            } else {
                isDataMessage = true
            }

            messageType = header & 0x1F
        }

        return RecordHeader(localMessageType: messageType,
                            isDataMessage: isDataMessage,
                            developerData: developerData)
    }
}
