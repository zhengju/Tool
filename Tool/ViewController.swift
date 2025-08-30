//
//  ViewController.swift
//  Tool
//
//  Created by zhengsw on 2025/8/29.
//

import UIKit
import SnapKit
import WebKit


class ViewController: UIViewController,WKUIDelegate,WKNavigationDelegate  {
    var wkWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        wkWebView = WKWebView()
        wkWebView.frame = CGRect(x: 10, y: 100, width: KSCREEN_WIDTH - 20 , height:KSCREEN_HEIGHT - 100 - 60)
        self.view.addSubview(wkWebView)
        wkWebView.uiDelegate = self
        wkWebView.navigationDelegate = self
        wkWebView.backgroundColor = UIColor.purple
        wkWebView.load(URLRequest(url: URL(string: "https://juejin.cn/post/6844903587030499341")!))
        
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100));
        label.text = "fsjkdgh";
        view.addSubview(label);
        
        label.snp.makeConstraints { make in
            make.left.equalTo(30)
        }
        
    }
    //https://github.com/dudongge/DDGScreenShot
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        wkWebView.shotScreenContentScrollCapture { screenShotImage in
            guard let screenShotImage = screenShotImage else { return }
            //保存到本地相册
            PhotoSaver().saveImageToPhotoLibrary(screenShotImage) { [weak self] success, error in
                if success {
                    self?.showAlert(title: "成功", message: "图片已保存到相册")
                } else {
                    self?.showAlert(title: "失败", message: error?.localizedDescription ?? "保存失败")
                }
                
            }
            
        }
    }
    
    private func showAlert(title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "确定", style: .default))
           present(alert, animated: true)
       }
}

