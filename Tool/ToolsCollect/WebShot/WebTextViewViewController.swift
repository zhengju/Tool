//
//  WebTextViewViewController.swift
//  Tool
//
//  Created by zhengsw on 2025/8/30.
//

import UIKit
import Flutter

class WebTextViewViewController: BaseFlutterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .blue
        
        // 设置MethodChannel
        let channel = FlutterMethodChannel(name: "webpage_screenshot",
                                           binaryMessenger: self.binaryMessenger)
        
        channel.setMethodCallHandler { [weak self] (call, result) in
            guard let self = self else { return }

            switch call.method {
            case "openWebpage":
                if let args = call.arguments as? [String: Any],
                   let urlString = args["url"] as? String {
                    self.pushVC(url: urlString)
                } else {
                    result(FlutterError(code: "INVALID_ARGUMENTS",
                                        message: "Invalid arguments",
                                        details: nil))
                }
            case "dismiss":
                self.dismiss()
            default:
                result(FlutterMethodNotImplemented)
            }
            
        }
    }
    
    func pushVC(url:String) {
        let vc = WebViewController(url: url);
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func dismiss() {
        self.navigationController?.popViewController(animated: true)

    }
}
