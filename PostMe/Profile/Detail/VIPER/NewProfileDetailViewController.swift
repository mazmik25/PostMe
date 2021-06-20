import UIKit

final class NewProfileDetailViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: NewProfileDetailPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Extensions -

extension NewProfileDetailViewController: NewProfileDetailViewInterface {
}
