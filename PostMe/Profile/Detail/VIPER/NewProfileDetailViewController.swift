import UIKit

final class NewProfileDetailViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: NewProfileDetailPresenterInterface!
    
    private var viewModels: [ProfileViewModel] = []
    private var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProfileCell")
        return tableView
    }()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.getDetailProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "View Profile"
    }

}

// MARK: - Extensions -

extension NewProfileDetailViewController: NewProfileDetailViewInterface {
    func reloadData(viewModels: [ProfileViewModel]) {
        self.viewModels = viewModels
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension NewProfileDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModels.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "ProfileCell")
        let viewModel: ProfileViewModel = viewModels[indexPath.row]
        
        // Setup title label
        cell.textLabel?.text = viewModel.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        cell.textLabel?.textColor = .lightGray
        
        // Setup subtitle label
        cell.detailTextLabel?.text = viewModel.subtitle
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        cell.detailTextLabel?.textColor = .black
        cell.detailTextLabel?.numberOfLines = 0
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

private extension NewProfileDetailViewController {
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
        tableView.delegate = self
        tableView.dataSource = self
    }
}
