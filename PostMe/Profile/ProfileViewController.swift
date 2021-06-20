//
//  ProfileViewController.swift
//  PostMe
//
//  Created by Azmi Muhammad on 19/06/21.
//

import UIKit

class ProfileViewController: UIViewController {

    private let tableView: UITableView = UITableView()
    private var profileViewModels: [ProfileViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileViewModels = [
            ProfileViewModel(title: "Name", subtitle: "Joko Sutjiptop")
        ]
        
        setupView()
        view.backgroundColor = .white
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
        return profileViewModels.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "ProfileCell")
        let profileViewModel: ProfileViewModel = profileViewModels[indexPath.row]
        
        // Setup title label
        cell.textLabel?.text = profileViewModel.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        cell.textLabel?.textColor = .lightGray
        
        // Setup subtitle label
        cell.detailTextLabel?.text = profileViewModel.subtitle
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        cell.detailTextLabel?.textColor = .black
        
        // Make the selection animation disappear
        cell.selectionStyle = .none
        return cell
    }
}

private extension ProfileViewController {
    func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
}
