//
//  NewsInfoView.swift
//  NewsApp
//
//  Created by Admin on 08.11.2023.
//

import UIKit

class NewsInfoView: UIView {
    
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
        iv.image = UIImage(named: "logo")
        iv.layer.cornerRadius = 8
        iv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        iv.clipsToBounds = true
        return iv
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.text = "Жили-были дед со старухой"
        return label
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 16)
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.text = "kewmcjoiweniconwericerwicmiermciremciremcirmcirmcirmirmcirmcirmcirmcirmcirmcirmcierkmcikemkcmrfedlkjv afkjed vkja dfj dafjv dfkja vkjf avj akj vkja jkvjker vjkerjnvjrenvjrnvjernvjernvjrnvjrnvjrnvrjvrd"
        return textView
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
        setupLabel()
        setupTextView()
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
    
    private func setupLabel() {
        contentView.addSubview(label)
        
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 32).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -32).isActive = true
    }
    
    private func setupTextView() {
        contentView.addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32).isActive = true
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32).isActive = true
        textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    func configure(image: UIImage, title: String) {
        imageView.image = image
        label.text = title
        
    }
}
