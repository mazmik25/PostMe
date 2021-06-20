//
//  ProfileViewController.swift
//  PostMe
//
//  Created by Azmi Muhammad on 19/06/21.
//

import UIKit

class ProfileViewController: UIViewController {

    private let tableView: UITableView = UITableView()
    private var viewModels: [ProfileViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchProfiles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Profile"
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
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
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let id: Int = viewModels[indexPath.row].id {
            let viewController: ProfileDetailViewController = ProfileDetailViewController()
            viewController.id = id
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

private extension ProfileViewController {
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
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProfileCell")
    }
    
    func fetchProfiles() {
        // Don't forget to give 'self' weak identifier so that it doesn't retain in our memory
        // You can read more detail about it here
        // https://medium.com/appcoda-tutorials/memory-management-in-swift-understanding-strong-weak-and-unowned-references-b80a06c82460
        ProfileApi().getProfiles { [weak self] result in
            switch result {
            case .success(let response):
                self?.viewModels = response.compactMap {
                    ProfileViewModel(
                        id: $0.id,
                        title: "Name",
                        subtitle: $0.name
                    )
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
