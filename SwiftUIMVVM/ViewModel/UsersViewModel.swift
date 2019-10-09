//
//  UsersViewModel.swift
//  SwiftUIMVVM
//
//  Created by Alex Nagy on 09/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

let apiUrl = "https://my.api.mockaroo.com/users.json?key=2a4c4f20"
// Build your own test database and API: https://www.mockaroo.com

class UsersViewModel: ObservableObject {
    @Published var users: [MVVMUser] = []
    
    func fetchUsers() {
        users.removeAll()
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        self.users = try JSONDecoder().decode([MVVMUser].self, from: data)
                    } catch let err {
                        print("Error: \(err)")
                    }
                }
            } else {
                print("HTTPURLResponse code: \(response.statusCode)")
            }
        }.resume()
    }
}

