//
//  ImageCache.swift
//  JMImageCacheKit
//
//  Created by 최정민 on 2022/03/23.
//

import UIKit

public enum ImageCache {
    public static let images = NSCache<NSString, UIImage>()
}
