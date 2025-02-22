//
//  SwiftDate
//  Parse, validate, manipulate, and display dates, time and timezones in Swift
//
//  Created by Daniele Margutti
//   - Web: https://www.danielemargutti.com
//   - Twitter: https://twitter.com/danielemargutti
//   - Mail: hello@danielemargutti.com
//
//  Copyright © 2019 Daniele Margutti. Licensed under MIT License.
//

import SwifterDate
import XCTest

class TestSwiftDate: XCTestCase {

	func testAutoFormats() {
		let builtInAutoFormats = SwifterDate.autoFormats
		XCTAssert((SwifterDate.autoFormats.isEmpty == false), "No auto formats available")
		let newFormats = [DateFormats.altRSS, DateFormats.extended, DateFormats.httpHeader]
		SwifterDate.autoFormats = newFormats
		XCTAssert( (SwifterDate.autoFormats == newFormats), "Failed to set new auto formats")
		SwifterDate.resetAutoFormats()
		XCTAssert( (SwifterDate.autoFormats == builtInAutoFormats), "Failed to reset auto formats")
	}

    func testUTCZone() {
        SwifterDate.defaultRegion = Region(calendar: Calendars.gregorian, zone: Zones.asiaShanghai, locale: Locales.current)
        
        // DO NOT recognized the right timezone
        // The timezone should be UTC
        let wrongZone = "2020-03-13T05:40:48.000Z"
        let wrongZoneDate = Date.init(wrongZone)
        print(wrongZoneDate!.description)
        XCTAssert("2020-03-13 05:40:48 +0000" == wrongZoneDate!.description)
        
        let iso8601Time = "2020-03-13T05:40:48+00:00"
        let iso8601Date = Date.init(iso8601Time)
        print(iso8601Date!.description)
        XCTAssert("2020-03-13 05:40:48 +0000" == iso8601Date!.description)
    }
}
