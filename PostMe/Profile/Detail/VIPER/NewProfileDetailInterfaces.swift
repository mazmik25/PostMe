import UIKit

protocol NewProfileDetailWireframeInterface: WireframeInterface {
}

protocol NewProfileDetailViewInterface: ViewInterface {
    func reloadData(viewModels: [ProfileViewModel])
}

protocol NewProfileDetailPresenterInterface: PresenterInterface {
    func getDetailProfile()
}

protocol NewProfileDetailInteractorInterface: InteractorInterface {
    func getDetailProfile(userId: Int, completion: @escaping (Result<[ProfileBodyResponse], Error>) -> Void)
}
