//
//  ViewController.swift
//  Tool
//
//  Created by zhengsw on 2025/8/29.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100));
        label.text = "fsjkdgh";
        view.addSubview(label);
        
        label.snp.makeConstraints { make in
            make.left.equalTo(30)
        }
    }
}

