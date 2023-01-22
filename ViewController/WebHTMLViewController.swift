//
//  WebHTMLViewController.swift
//  KathiravanVajroTask
//
//  Created by Mac on 21/01/23.
//

import UIKit
import WebKit

class WebHTMLViewController: UIViewController {

    @IBOutlet weak var web_view: WKWebView!
    
    var web_Load = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = false
        web_view.loadHTMLString(web_Load, baseURL: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
