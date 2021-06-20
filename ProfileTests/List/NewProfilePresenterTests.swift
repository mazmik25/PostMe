import XCTest
@testable import Profile

class NewProfilePresenterTests: XCTestCase {
    
    private let bundle: Bundle = Bundle(for: NewProfilePresenterTests.self)
    
    private var sut: NewProfilePresenterInterface!
    private var mockView: MockNewProfileViewController!
    private var mockInteractor: MockNewProfileInteractor!
    private var mockWireframe: MockNewProfileWireframe!

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
            filename: "get_profiles",
            bundle: bundle
        ))
        
        sut.getProfiles()
        XCTAssertNotNil(mockView.viewModels)
        XCTAssertTrue(mockView.viewModels?.count ?? 0 > 0)
    }
    
    func testGetProfileEmpty() throws {
        initializeSUT(mockApi: MockProfileApiService(
            filename: "empty_response",
            bundle: bundle
        ))
        
        sut.getProfiles()
        XCTAssertNotNil(mockView.viewModels)
        XCTAssertTrue(mockView.viewModels?.count ?? 0 == 0)
    }

    func testMoveToDetailViewSuccess() throws {
        initializeSUT(mockApi: MockProfileApiService(
            filename: "get_profiles",
            bundle: bundle
        ))
        
        sut.getProfiles()
        XCTAssertNotNil(mockView.viewModels)
        XCTAssertTrue(mockView.viewModels?.count ?? 0 > 0)
        
        sut.viewDetail(profile: mockView.viewModels![0])
        XCTAssertNotNil(mockWireframe.userId)
        XCTAssertTrue(mockWireframe.userId ?? 0 > 0)
    }
    
    func testMoveToDetailViewFailed() throws {
        initializeSUT(mockApi: MockProfileApiService(
            filename: "get_profiles",
            bundle: bundle
        ))
        
        sut.getProfiles()
        XCTAssertNotNil(mockView.viewModels)
        XCTAssertTrue(mockView.viewModels?.count ?? 0 > 0)
    }
}

private extension NewProfilePresenterTests {
    private func initializeSUT(mockApi: MockProfileApiService?) {
        if let mockApi: MockProfileApiService = mockApi {
            mockInteractor = MockNewProfileInteractor(mockApi: mockApi)
            mockWireframe = MockNewProfileWireframe()
            mockView = MockNewProfileViewController()
            
            sut = NewProfilePresenter(
                view: mockView,
                interactor: mockInteractor,
                wireframe: mockWireframe
            )
        }
    }
}

private final class MockNewProfileInteractor: NewProfileInteractorInterface {
    
    private let mockApi: MockProfileApiService
    
    init(mockApi: MockProfileApiService) {
        self.mockApi = mockApi
    }
    
    func getProfiles(completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void) {
        mockApi.getProfiles(completion: completion)
    }
}

private final class MockNewProfileWireframe: NewProfileWireframeInterface {
    private(set) var userId: Int?
    
    func navigate(to option: NewProfileNavigationOption) {
        switch option {
        case .detail(let userId): self.userId = userId
        }
    }
}

private final class MockNewProfileViewController: UIViewController,
                                                  NewProfileViewInterface {
    private(set) var viewModels: [ProfileViewModel]?
    
    func reloadData(viewModels: [ProfileViewModel]) {
        self.viewModels = viewModels
    }
}
