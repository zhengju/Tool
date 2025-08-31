//
//  MainViewController.swift
//  Tool
//
//  Created by zhengsw on 2025/8/30.
//

import UIKit
import Flutter

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        // 跳转到Flutter页面A按钮
        let buttonA = UIButton(type: .system)
        buttonA.setTitle("跳转到Flutter页面A", for: .normal)
        buttonA.addTarget(self, action: #selector(goToFlutterPageA), for: .touchUpInside)
        buttonA.frame = CGRect(x: 50, y: 200, width: 250, height: 50)
        view.addSubview(buttonA)
        
        // 跳转到Flutter页面B按钮
        let buttonB = UIButton(type: .system)
        buttonB.setTitle("跳转到Flutter页面B", for: .normal)
        buttonB.addTarget(self, action: #selector(goToFlutterPageB), for: .touchUpInside)
        buttonB.frame = CGRect(x: 50, y: 300, width: 250, height: 50)
        view.addSubview(buttonB)
    }
    
    @objc private func goToFlutterPageA() {
        // 跳转到Flutter页面A（使用默认入口点）
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let engine = appDelegate.engineGroup.makeEngine(withEntrypoint: nil, libraryURI: nil)
        
        let flutterVC = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        navigationController?.pushViewController(flutterVC, animated: true)
    }
    
    @objc private func goToFlutterPageB() {
       let flutterVC = WebTextViewViewController(withInitialRoute: "/second")
       navigationController?.pushViewController(flutterVC, animated: true)
    }
}
