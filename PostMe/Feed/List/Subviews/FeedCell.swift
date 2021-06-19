//
//  FeedCell.swift
//  PostMe
//
//  Created by Azmi Muhammad on 19/06/21.
//

import UIKit

class FeedCell: UITableViewCell {
    
    var viewModel: FeedModel? {
        didSet {
            feedImageView.image = viewModel?.image
            headlineLabel.text = viewModel?.headline
        }
    }
    
    private lazy var feedImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1.0
        return imageView
    }()
    
    private lazy var headlineLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.textAlignment = .justified
        return label
    }()
    
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
        selectionStyle = .none
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
