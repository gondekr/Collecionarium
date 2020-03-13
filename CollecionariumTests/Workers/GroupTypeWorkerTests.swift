//
//  Created by Rubens Gondek on 13/03/20.
//  Copyright © 2020 Gondek. All rights reserved.
//

import XCTest
@testable import Collecionarium

class GroupTypeWorkerTests: XCTestCase {
    var worker: GroupTypeWorker!
    var expectedCount: Int = 0

    override func setUp() {
        worker = GroupTypeWorker()
        expectedCount = 7
    }

    // Test if get types returns exactly expected number of group types
    func test_GetTypes_ShouldReturnExpectedCount() {
        // When
        let generated = worker.getTypes().count

        // Then
        XCTAssertEqual(generated, expectedCount, "Get types count different than \(expectedCount)")
    }

    // Test if all types have different ids
    func test_GetTypes_ShouldHaveUniqueIds() {
        // When
        let allIds = worker.getTypes().map { $0.id }
        let generated = allIds.count
        let uniqueIds = Set<String>(allIds).count

        // Then
        XCTAssertEqual(generated, uniqueIds, "Ids are not unique")
        XCTAssertEqual(generated, expectedCount, "Different number of ids than expected")
    }
}
