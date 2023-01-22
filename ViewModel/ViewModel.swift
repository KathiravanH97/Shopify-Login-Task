//
//  ViewModel.swift
//  KathiravanVajroTask
//
//  Created by Mac on 21/01/23.
//

import Foundation



// MARK: GETAPI RESPONSE
var jsonData : apiData?
class Parser{
    
    func parse(comp: @escaping([subArticles])->()){
        guard let url = URL(string: "https://run.mocky.io/v3/cdc1c53e-2825-4162-826d-b8294e477934")else{
            print("error")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){data,response,error in
            guard error == nil else{
                print("error1")
                return
            }
            guard let data = data else{
                print("error2")
                return
            }
            guard let response = response as? HTTPURLResponse,(200..<299) ~= response.statusCode else{
                print("error3")
                return
            }
            do {
                let jsonresponse = try JSONDecoder().decode(apiData.self, from: data)
                print(jsonresponse)
                let array = jsonresponse.articles
                print(array!)
                comp(array!)
            }
            catch {
                print("invalid")
                return
            }
        }.resume()
        
        
    }
}
