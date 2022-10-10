

//  BookUsers.swift
//  List Dynamic
//  Created by GranzaX on 13/03/22.


import Foundation
import SwiftyJSON

class BookUsersPresenter : ObservableObject {
    func loadData(completion:@escaping ([Book]) -> ()) {
        guard let url = URL(string: "https://reqres.in/api/users?page=1") else {
            print("Invalid url...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let json = JSON(data!)
            if let jsonData = json["data"].description.data(using: .utf8) {
                do {
                    let bookData = try JSONDecoder().decode([Book].self, from: jsonData)
                    completion(bookData)
                } catch {
                    print(error.localizedDescription)
                    let bookData = [Book]()
                    completion(bookData)
                }
            }
        }.resume()
    }
}
