//
//  CustomCell.swift
//  Quilix-cs-ios
//
//  Created by Алексей Авдейчик on 1.02.22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var post: Post?
    
    static let id = "CustomCell"
    
    //MARK: - UI
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let miniImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    //MARK: - ConfigureUI
    
    func configureUI() {
        configureLabel()
        configureMiniImage()
    }
    
    func configureLabel() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.widthAnchor.constraint(equalToConstant: 230)
        ])
    }
    
    func configureMiniImage() {
        contentView.addSubview(miniImage)
        miniImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            miniImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            miniImage.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 20),
            miniImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            miniImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            miniImage.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configure(with post: Post) {
        label.text = post.title
        guard let recivedImage = try? Data(contentsOf: URL(string: post.thumbnailUrl)!) else { return }
        miniImage.image = UIImage(data: recivedImage)
    }
}

