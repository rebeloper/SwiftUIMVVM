//
//  RemoteImageUrl.swift
//  SwiftUIMVVM
//
//  Created by Alex Nagy on 09/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

class RemoteImageUrl: ObservableObject {
    @Published var data = Data()
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
