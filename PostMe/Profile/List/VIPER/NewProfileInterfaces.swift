import UIKit

enum NewProfileNavigationOption {
    case detail(userId: Int)
}

protocol NewProfileWireframeInterface: WireframeInterface {
    func navigate(to option: NewProfileNavigationOption)
}

protocol NewProfileViewInterface: ViewInterface {
    func reloadData(viewModels: [ProfileViewModel])
}

protocol NewProfilePresenterInterface: PresenterInterface {
    func getProfiles()
    func viewDetail(profile: ProfileViewModel)
}

protocol NewProfileInteractorInterface: InteractorInterface {
    func getProfiles(completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void)
}
