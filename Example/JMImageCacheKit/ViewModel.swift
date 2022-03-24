//
//  ViewModel.swift
//  JMImageCacheKit_Example
//
//  Created by 최정민 on 2022/03/24.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

final class ViewModel {
    var photos: [String] = [
        "https://user-images.githubusercontent.com/75533266/159773100-fc7518a3-5972-460b-895e-d2c87a334126.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773250-9460e64c-f984-4ecc-b129-284335c8284c.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773255-afe02726-3987-47e1-af4c-3fa0e71b906f.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773259-bdc84c96-4239-4ee2-82c3-3080f57d4ede.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773268-45b4fdad-b489-4f30-b36d-0dc8f983b991.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773272-f15bde81-6534-46f8-9c14-da7a532ab8ea.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773274-8055a481-6de7-4aa1-a706-40fdd425249c.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773275-b492c00e-6d46-4916-97a2-be09f6df9650.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773277-3e01ba8a-c92a-41a4-9ce6-20c3077482e4.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773283-61b2da19-b7cd-4853-b82e-8d6e29dc3d5d.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773284-1e76d7f3-bad8-4543-822a-b2f05d1cf707.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773287-ee011adb-f79a-4beb-8b5d-5ee6fa38bb3a.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773289-224030ed-7ebe-4e77-9ae3-7aa30e90a2a5.jpeg",
        "https://user-images.githubusercontent.com/75533266/159773291-076e9d67-e7cc-45e7-b0da-70131dc61c13.jpeg"
    ]
    
    func getAllCountsOfPhotos() -> Int {
        return photos.count
    }
    
    func getPhoto(indexPathRow: Int) -> String {
        return photos[indexPathRow]
    }
}
