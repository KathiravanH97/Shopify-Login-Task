//
//  HomeViewController.swift
//  KathiravanVajroTask
//
//  Created by Mac on 21/01/23.
//

import UIKit

class HomeViewController: UIViewController{
//    var jsonData : apiData?
    var apiData = Parser()
    var jsonvalue = [subArticles]()
    var activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    var refreshControl = UIRefreshControl()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        
//        activityView.startAnimating()
        fetchJsonResponse()
//        activityView.stopAnimating()
        pullToRefresh()
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func fetchJsonResponse() {
        apiData.parse{
            data in
            self.jsonvalue = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    func pullToRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: refreshConstant.refresh)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    @objc func refresh(_ sender: AnyObject){
        fetchJsonResponse()
    }
}
