import XCTest
@testable import Profile

class NewProfileDetailInteractorTests: XCTestCase {
    private let bundle: Bundle = Bundle(for: NewProfileDetailInteractorTests.self)
    private var sut: NewProfileDetailInteractor!

    override func setUpWithError() throws {
        initializeSUT(api: nil)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetProfilesSuccess() throws {
        initializeSUT(
            api: MockProfileApiService(
                filename: "get_detail_profile",
                bundle: bundle
            )
        )
        sut.getDetailProfile(userId: 1) { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response.first)
                XCTAssertTrue(response.count > 0)
            case .failure(let error):
                XCTFail("An error found here \(error)")
            }
        }
    }

    func testGetProfilesEmpty() throws {
        initializeSUT(
            api: MockProfileApiService(
                filename: "empty_response",
                bundle: bundle
            )
        )
        sut.getDetailProfile(userId: 1)  { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertTrue(response.count == 0)
            case .failure(let error):
                XCTFail("An error found here \(error)")
            }
        }
    }
    
    func testGetProfilesInvalidResponse() throws {
        initializeSUT(
            api: MockProfileApiService(
                filename: "invalid_response",
                bundle: bundle
            )
        )
        sut.getDetailProfile(userId: 1)  { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertTrue(response.count > 0)
                XCTAssertNil(response.first?.address)
                XCTAssertNil(response.first?.company)
                XCTAssertNil(response.first?.email)
                XCTAssertNil(response.first?.id)
                XCTAssertNil(response.first?.name)
                XCTAssertNil(response.first?.phone)
                XCTAssertNil(response.first?.website)
            case .failure(let error):
                XCTFail("An error found \(error)")
            }
        }
    }
}

private extension NewProfileDetailInteractorTests {
    func initializeSUT(api: MockProfileApiService? = nil) {
        if let api: MockProfileApiService = api {
            sut = NewProfileDetailInteractor(api: api)
        }
    }
}
