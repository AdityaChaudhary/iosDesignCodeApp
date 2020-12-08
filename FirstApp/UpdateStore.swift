//
//  UpdateStore.swift
//  FirstApp
//
//  Created by Aditya Chaudhary on 13/11/2020.
//  Copyright © 2020 Phantom. All rights reserved.
//

import SwiftUI
import Combine


class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
