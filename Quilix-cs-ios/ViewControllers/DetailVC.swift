//
//  DetailVC.swift
//  Quilix-cs-ios
//
//  Created by Алексей Авдейчик on 1.02.22.
//

import UIKit
 
class DetailVC: UIViewController {
    
    var post: Post?
    
        //MARK: - UI
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        addData()
    }

    private func addData() {
        label.text = post?.title
        guard let recivedImage = try? Data(contentsOf: URL(string: post!.url)!) else { return }
        imageView.image = UIImage(data: recivedImage)
    }
    
    private func configure() {
        configureTableView()
        configureImageView()
    }
    
    private func configureTableView() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configureImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}

