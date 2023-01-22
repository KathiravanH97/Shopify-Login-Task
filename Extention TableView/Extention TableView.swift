//
//  TableView Extention.swift
//  KathiravanVajroTask
//
//  Created by Mac on 21/01/23.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonvalue.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabCell") as! TableViewCell
        cell.lbl1.text = jsonvalue[indexPath.row].title
        cell.lbl2.font = UIFont(name: "Montserrat-Semi-Bold", size: 27)
        cell.lbl2.text = "\(jsonvalue[indexPath.row].summary_html!)"
        if let url = URL(string:(jsonvalue[indexPath.row].image?.src)! ) {
            cell.img.frame.size.width = CGFloat((jsonvalue[indexPath.row].image?.width!)!)
            cell.img.frame.size.height = CGFloat((jsonvalue[indexPath.row].image?.height!)!)
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async { /// execute on main thread
                    cell.img.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabCell") as! TableViewCell
            let svc = self.storyboard?.instantiateViewController(withIdentifier: "WebHTMLViewController") as! WebHTMLViewController
        svc.web_Load = jsonvalue[indexPath.row].body_html!
            self.navigationController?.pushViewController(svc, animated: true)
    }
}
