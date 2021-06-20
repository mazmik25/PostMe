//
//  ProfileDetailViewController.swift
//  PostMe
//
//  Created by Azmi Muhammad on 20/06/21.
//

import UIKit
import Profile

class ProfileDetailViewController: UIViewController {

    private let tableView: UITableView = UITableView()
    private var viewModels: [ProfileViewModel] = []
    
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDetailProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "View Profile"
    }

}

extension ProfileDetailViewController: UITableViewDelegate, UITableViewDataSource {
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

private extension ProfileDetailViewController {
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
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProfileCell")
    }
    
    func fetchDetailProfile() {
        // Don't forget to give 'self' weak identifier so that it doesn't retain in our memory
        // You can read more detail about it here
        // https://medium.com/appcoda-tutorials/memory-management-in-swift-understanding-strong-weak-and-unowned-references-b80a06c82460
        ProfileApi().getDetailProfile(id: id) { [weak self] result in
            switch result {
            case .success(let response):
                let profile: ProfileBodyResponse? = response.first
                self?.viewModels = [
                    ProfileViewModel(id: self?.id, title: "Name", subtitle: profile?.name),
                    ProfileViewModel(id: self?.id, title: "Address", subtitle: profile?.fullAdress),
                    ProfileViewModel(id: self?.id, title: "Company", subtitle: profile?.companyProfile)
                ]
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

