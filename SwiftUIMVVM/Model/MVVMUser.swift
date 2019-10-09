//
//  MVVMUser.swift
//  SwiftUIMVVM
//
//  Created by Alex Nagy on 09/10/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import SwiftUI

struct MVVMUser: Identifiable, Decodable {
    let id = UUID()
    let uid: Int
    let firstName: String
    let lastName: String
    let email: String
    let avatarUrl: String
}
