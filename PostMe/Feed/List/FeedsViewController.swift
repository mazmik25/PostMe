//
//  FeedsViewController.swift
//  PostMe
//
//  Created by Azmi Muhammad on 19/06/21.
//

import UIKit

class FeedsViewController: UIViewController {
    
    private let tableView: UITableView = UITableView()
    private var viewModels: [FeedViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchFeeds()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Feed"
    }

}

// MARK: - Table View Delegate and Data Source
extension FeedsViewController: UITableViewDelegate, UITableViewDataSource {
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
        guard let cell: FeedCell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else { return UITableViewCell() }
        cell.viewModel = viewModels[indexPath.count]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let postId: Int = viewModels[indexPath.row].id {
            let viewController: FeedsDetailViewController = FeedsDetailViewController()
            viewController.postId = postId
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// MARK: - Private Methods
private extension FeedsViewController {
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
        tableView.register(FeedCell.self, forCellReuseIdentifier: "FeedCell")
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    func fetchFeeds() {
        FeedApi().getFeeds { [weak self] result in
            switch result {
            case .success(let response):
                self?.viewModels = response.compactMap {
                    FeedViewModel(
                        id: $0.id,
                        image: UIImage(named: "news_placeholder"),
                        headline: $0.title
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
