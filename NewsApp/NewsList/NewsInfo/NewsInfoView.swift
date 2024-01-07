//
//  NewsInfoView.swift
//  NewsApp
//
//  Created by Admin on 08.11.2023.
//

import UIKit

class NewsInfoView: UIView {
    
    var isFavorite = false {
        didSet {
            updateAddToFavoritesButton()
        }
    }
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let contentView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
//        iv.layer.cornerRadius = 24
//        iv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        iv.clipsToBounds = true
        return iv
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .systemGray5
        label.clipsToBounds = true
        return label
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 16)
        return textView
    }()
    
    private let labelDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.text = "01.01.1994"
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти к источнику", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray4
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonSave: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.tintColor = .red
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.mainColor
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        setupScrollView()
        setupContentView()
        setupImageView()
        setupLabelDate()
        setupLabel()
        setupTextView()
        setupButton()
        setupButtonSave()
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    private func setupLabelDate() {
        contentView.addSubview(labelDate)
        
        labelDate.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        labelDate.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func setupLabel() {
        contentView.addSubview(labelTitle)
        
        labelTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20).isActive = true
    }
    
    private func setupTextView() {
        contentView.addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 32).isActive = true
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupButton() {
        contentView.addSubview(button)
        
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32).isActive = true
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 190).isActive = true
    }
    
    private func setupButtonSave() {
        contentView.addSubview(buttonSave)
        
        buttonSave.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -12).isActive = true
        buttonSave.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -12).isActive = true
        buttonSave.widthAnchor.constraint(equalToConstant: 30).isActive = true
        buttonSave.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    func updateAddToFavoritesButton() {
        if isFavorite {
            buttonSave.setBackgroundImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        } else {
            buttonSave.setBackgroundImage(UIImage(systemName: "suit.heart"), for: .normal)
        }
    }
    
    func configure(image: UIImage, title: String, discription: String, publishedAt: String?) {
        imageView.image = image
        labelTitle.text = title
        textView.text = discription
        labelDate.text = publishedAt
        
        updateAddToFavoritesButton()
    }
}
