//
//  PhotoTableViewCell.swift
//  JMImageCacheKit_Example
//
//  Created by 최정민 on 2022/03/24.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

final class PhotoTableViewCell: UITableViewCell {
    static let identifier = "PhotoTableViewCell"
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private var uuid: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        addAllSubviews()
        setAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotoTableViewCell {
    func set(image: UIImage?) {
        photoImageView.image = image
    }
    
    func set(uuid: String) {
        self.uuid = uuid
    }
    
    func getUUID() -> String? {
        return uuid
    }
    
    private func addAllSubviews() {
        contentView.addSubview(photoImageView)
    }
    
    private func setAllConstraints() {
        setConstraintsOfPhotoImageView()
    }
    
    private func setConstraintsOfPhotoImageView() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
