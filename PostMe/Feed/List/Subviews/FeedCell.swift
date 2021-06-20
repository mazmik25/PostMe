//
//  FeedCell.swift
//  PostMe
//
//  Created by Azmi Muhammad on 19/06/21.
//

import UIKit

class FeedCell: UITableViewCell {
    
    var viewModel: FeedViewModel? {
        didSet {
            feedImageView.image = viewModel?.image
            headlineLabel.text = viewModel?.headline
        }
    }
    
    private lazy var feedImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1.0
        return imageView
    }()
    
    private lazy var headlineLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.numberOfLines = numberOfLines
        label.textAlignment = .justified
        return label
    }()
    
    var numberOfLines: Int = 2 {
        didSet { headlineLabel.numberOfLines = numberOfLines }
    }
    
    var headlineTextColor: UIColor? {
        didSet { headlineLabel.textColor = headlineTextColor }
    }
    
    var headlineFont: UIFont? {
        didSet { headlineLabel.font = headlineFont }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension FeedCell {
    func setupView() {
        contentView.addSubview(feedImageView)
        contentView.addSubview(headlineLabel)
        
        feedImageView.translatesAutoresizingMaskIntoConstraints = false
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            feedImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            feedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            feedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            feedImageView.heightAnchor.constraint(equalToConstant: 180.0),
            headlineLabel.topAnchor.constraint(equalTo: feedImageView.bottomAnchor, constant: 8),
            headlineLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            headlineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            headlineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
    }
}
