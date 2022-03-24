//
//  ViewController.swift
//  JMImageCacheKit
//
//  Created by alwaysblu on 03/23/2022.
//  Copyright (c) 2022 alwaysblu. All rights reserved.
//

import UIKit
import JMImageCacheKit

final class ViewController: UIViewController {
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.register(PhotoTableViewCell.classForCoder(), forCellReuseIdentifier: PhotoTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        addAllSubviews()
        setAllConstraints()
        setAllDelegates()
    }
}

extension ViewController {
    private func setAllDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func addAllSubviews() {
        view.addSubview(tableView)
    }
    
    private func setAllConstraints() {
        setConstraintsOfTableView()
    }
    
    private func setConstraintsOfTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getAllCountsOfPhotos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath) as? PhotoTableViewCell else {
            return PhotoTableViewCell()
        }
        let reuseIdentifier = UUID().uuidString
        
        cell.set(uuid: reuseIdentifier)
        viewModel.getPhoto(indexPathRow: indexPath.row).requestImage(imageView: cell.photoImageView) { image in
            guard reuseIdentifier == cell.getUUID() else { return }
            cell.set(image: image)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
