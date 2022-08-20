//
//  TodoModel.swift
//  TodoReactorKit
//
//  Created by wooseok.suh on 2022/08/20.
//

import Foundation

struct TodoModel {
    let title: String
    let content: String
    var priority: Priority
    var status: Status
    let identifier: String = "\(UUID.init())"
    
    enum Priority: String {
        case high = "HIGH"
        case medium = "MEDIUM"
        case low = "LOW"

        func convertToInt() -> Int {
            switch self {
            case .high: return 0
            case .medium: return 1
            case .low: return 2
            }
        }
    }

    enum Status: String {
        case todo = "TODO"
        case progress = "PROGRESS"
        case done = "DONE"
    }
}
