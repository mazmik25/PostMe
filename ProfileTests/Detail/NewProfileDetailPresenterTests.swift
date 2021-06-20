import XCTest
@testable import Profile

class NewProfileDetailPresenterTests: XCTestCase {
    private let bundle: Bundle = Bundle(for: NewProfilePresenterTests.self)
    
    private var sut: NewProfileDetailPresenterInterface!
    private var mockView: MockNewProfileDetailViewController!
    private var mockInteractor: MockNewProfileDetailInteractor!
    private var mockWireframe: MockNewProfileDetailWireframe!

    override func setUpWithError() throws {
        initializeSUT(mockApi: nil)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockView = nil
        mockInteractor = nil
        mockWireframe = nil
    }

    func testGetProfilesSuccess() throws {
        initializeSUT(mockApi: MockProfileApiService(
            filename: "get_detail_profile",
            bundle: bundle
        ))
        
        sut.getDetailProfile()
        XCTAssertNotNil(mockView.viewModels)
        XCTAssertTrue(mockView.viewModels?.count ?? 0 > 0)
    }
    
    func testGetProfileEmpty() throws {
        initializeSUT(mockApi: MockProfileApiService(
            filename: "empty_response",
            bundle: bundle
        ))
        
        sut.getDetailProfile()
        XCTAssertNotNil(mockView.viewModels)
        XCTAssertNil(mockView.viewModels![1].subtitle)
        XCTAssertNil(mockView.viewModels![2].subtitle)
    }
}

private extension NewProfileDetailPresenterTests {
    private func initializeSUT(mockApi: MockProfileApiService?) {
        if let mockApi: MockProfileApiService = mockApi {
            mockInteractor = MockNewProfileDetailInteractor(mockApi: mockApi)
            mockWireframe = MockNewProfileDetailWireframe()
            mockView = MockNewProfileDetailViewController()
            
            sut = NewProfileDetailPresenter(
                view: mockView,
                interactor: mockInteractor,
                wireframe: mockWireframe,
                userId: 1
            )
        }
    }
}

private final class MockNewProfileDetailInteractor: NewProfileDetailInteractorInterface {
    
    private let mockApi: MockProfileApiService
    
    init(mockApi: MockProfileApiService) {
        self.mockApi = mockApi
    }
    
    func getDetailProfile(userId: Int, completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void) {
        mockApi.getDetailProfile(userId: userId, completion: completion)
    }
}

private final class MockNewProfileDetailWireframe: NewProfileDetailWireframeInterface {
}

private final class MockNewProfileDetailViewController: UIViewController,
                                                  NewProfileDetailViewInterface {
    private(set) var viewModels: [ProfileViewModel]?
    
    func reloadData(viewModels: [ProfileViewModel]) {
        self.viewModels = viewModels
    }
}
