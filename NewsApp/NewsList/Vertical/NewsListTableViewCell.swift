//
//  NewsListTableViewCell.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class NewsListTableViewCell: UITableViewCell {
    
    static let reuseId = "NewsListTableViewCell"
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 3
        return label
    }()
    
    private let labelDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 12)
        label.text = "12.10.1994"
        label.textColor = .systemGray2
        return label
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayour()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        productImageView.image = nil
        title.text = nil
    }
    
    private func setupLayour() {
        setupImage()
        setupLabel()
        setupLabelDate()
    }
    
    private func setupImage() {
        contentView.addSubview(productImageView)
        
        productImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setupLabel() {
        contentView.addSubview(title)
        
        title.topAnchor.constraint(equalTo: productImageView.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16).isActive = true
        title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
    }
    
    private func setupLabelDate() {
        contentView.addSubview(labelDate)
        
        labelDate.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor).isActive = true
        labelDate.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 16).isActive = true
    }
    
    func configure(arcticle: Article, publishedAt: String?, imagesProvider: ImagesProvider) {
        title.text = arcticle.title
        labelDate.text = publishedAt
        
        imagesProvider.image(for: arcticle.urlToImage) { [weak self] image in
            DispatchQueue.main.async {
                if let image = image {
                    self?.productImageView.image = image
                } else {
                    self?.productImageView.image = UIImage(named: "logo")
                }
            }
        }
    }
}
