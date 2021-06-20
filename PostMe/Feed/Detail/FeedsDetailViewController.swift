//
//  FeedsDetailViewController.swift
//  PostMe
//
//  Created by Azmi Muhammad on 19/06/21.
//

import UIKit

class FeedsDetailViewController: UIViewController {

    private let tableView: UITableView = UITableView()
    private var viewModel: FeedViewModel?
    
    var postId: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDetailFeed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "View Feed"
    }

}

// MARK: - Table View Delegate and Data Source
extension FeedsDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell: FeedCell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell else { return UITableViewCell() }
        cell.viewModel = viewModel
        cell.numberOfLines = 0
        cell.headlineTextColor = UIColor.black
        cell.headlineFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Private Methods
private extension FeedsDetailViewController {
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
    
    func fetchDetailFeed() {
        FeedApi().fetchDetailFeed(id: postId) { [weak self] result in
            switch result {
            case .success(let response):
                self?.viewModel = FeedViewModel(
                    id: response.id,
                    image: UIImage(named: "news_placeholder"),
                    headline: response.body
                )
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
