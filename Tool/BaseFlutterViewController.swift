//
//  BaseFlutterViewController.swift
//  Tool
//
//  Created by zhengsw on 2025/8/30.
//

import UIKit
import Flutter


class BaseFlutterViewController: FlutterViewController {
    
    init(withInitialRoute initialRoute: String?) {
//        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        let newEngine = appDelegate.engineGroup.makeEngine(withEntrypoint: nil, libraryURI: nil)
        super.init(project: nil, initialRoute: initialRoute, nibName: nil, bundle: nil)

    }
       
    required convenience init(coder aDecoder: NSCoder) {
        self.init(withInitialRoute: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        
    }

}
