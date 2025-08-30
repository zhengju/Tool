//
//  PhotoSaver.swift
//  Tool
//
//  Created by zhengsw on 2025/8/29.
//

import Photos
import UIKit

class PhotoSaver {
    
    // 检查相册权限
    func checkPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized, .limited:
            completion(true)
        case .denied, .restricted:
            completion(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                DispatchQueue.main.async {
                    completion(newStatus == .authorized || newStatus == .limited)
                }
            }
        @unknown default:
            completion(false)
        }
    }
    
    // 保存图片到相册
   func saveImageToPhotoLibrary(_ image: UIImage, completion: @escaping (Bool, Error?) -> Void) {
        checkPhotoLibraryPermission { [weak self] hasPermission in
            guard hasPermission else {
                completion(false, NSError(domain: "PhotoSaver", code: 1, userInfo: [NSLocalizedDescriptionKey: "没有相册访问权限"]))
                return
            }
            
            self?.performSaveImage(image, completion: completion)
        }
    }
    
    private func performSaveImage(_ image: UIImage, completion: @escaping (Bool, Error?) -> Void) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }) { success, error in
            DispatchQueue.main.async {
                completion(success, error)
            }
        }
    }
}
