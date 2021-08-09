//
//  DIContainer.swift
//  swifty-companion
//
//  Created by Fenix Lavon on 8/9/21.
//  Copyright © 2021 Fenix Lavon. All rights reserved.
//

import Foundation

final class Container {
    static let shared = Container()
    private init() {}
    lazy var coreDataStack = CoreDataStack(modelName: "swifty_companion")
}
