//
//  String+Extension.swift
//  JMImageCacheKit
//
//  Created by 최정민 on 2022/03/23.
//

import UIKit

extension String {
    public func requestImage(imageView: UIImageView?, completion: @escaping (UIImage?) -> Void) {
        guard imageView?.isHidden == false || imageView == nil else { return }
        checkLoadingImageView(imageView: imageView)
        
        guard let image = ImageCache.images.object(forKey: self as NSString) else {
            let loadingImageView = LoadingImageView()
            DispatchQueue.global().async {
                setGIF(mainImageView: imageView, loadingImageView: loadingImageView)
                guard let image = getImage(self) else {
                    loadingImageView.removeGIF()
                    return
                }
                DispatchQueue.main.async {
                    loadingImageView.removeGIF()
                    ImageCache.images.setObject(image, forKey: self as NSString)
                    completion(image)
                }
            }

            return
        }

        completion(image)
    }
    
    private func checkLoadingImageView(imageView: UIImageView?) {
        guard let imageView = imageView else { return }
        imageView.image = nil
        for subView in imageView.subviews {
            if let loadingImageView = subView as? LoadingImageView {
                loadingImageView.removeGIF()
                return
            }
        }
    }
    
    private func setGIF(mainImageView: UIImageView?, loadingImageView: UIImageView) {
        DispatchQueue.main.async {
            let mainImageViewFrame = mainImageView?.frame ?? .zero
            loadingImageView.frame = CGRect(x: mainImageViewFrame.width/2 - 25, y: mainImageViewFrame.height/2 - 25, width: 50, height: 50)
            mainImageView?.addSubview(loadingImageView)
        }
    }
    
    private func getImage(_ urlString: String) -> UIImage? {
        guard let imageURL = URL(string: urlString) else { return nil }
        
        do {
            let imageData = try Data(contentsOf: imageURL)
            
            return UIImage(data: imageData)
        } catch {
            String(describing: error).log(where: "Extension/UICollectionViewCell/getImage")
        }
        
        return nil
    }
    
    public func log(where location: String? = nil) {
        print("\n")
        print("-------------------------------------------------------------")
        print(" Message : \(self)")
        if let location = location {
            print(" Where   : \(location)")
        }
        print(" When    : \(Date())")
        print("-------------------------------------------------------------")
        print("\n")
    }
}
