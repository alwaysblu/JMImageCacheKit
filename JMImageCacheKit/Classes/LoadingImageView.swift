//
//  LoadingImageView.swift
//  JMImageCacheKit
//
//  Created by 최정민 on 2022/03/23.
//

import UIKit

public final class LoadingImageView: UIImageView {
    static let identifier = UUID().uuidString
    
    public init() {
        super.init(frame: .zero)
        image = getLoadingGif()
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func removeGIF() {
        DispatchQueue.main.async {
            self.removeFromSuperview()
            self.image = nil
        }
    }
    
    private func getLoadingGif() -> UIImage? {
        guard let podBundle = Bundle(identifier: "org.cocoapods.JMImageCacheKit"),
              let url = podBundle.url(forResource: "loading", withExtension: "gif"),
              let imageData = try? Data(contentsOf: url) else {
            return nil }
        return UIImage.gifImageWithData(imageData)
    }
}
