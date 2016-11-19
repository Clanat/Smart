//
//  Process.swift
//  Smart
//
//  Created by Nick Zatsepilov on 20/11/16.
//
//

import Foundation

typealias ProcessId = UInt

let procDirectory = "/proc/"

enum ProcessState: Character {
    case running = "R"
    case sleeping = "S"
    case waiting = "D"
    case zombie = "Z"
    case stopped = "T"
    case dead = "X"
}

struct Process {
    let id: ProcessId
    let directory: String
    
    init?(id: ProcessId) {
        guard id.isValid else { return nil }
        
        self.id = id
        self.directory = procDirectory + "\(id)/"
    }
}

extension ProcessId {
    var isValid: Bool {
        return FileManager.default.fileExists(atPath: procDirectory + "\(self)/stat")
    }
}

struct ProcessInfo {
    let id: ProcessId?
    let name: String
    let state: ProcessState
    
    init?(id: ProcessId) {
        guard id.isValid else { return nil }
        
        self.id = id
        self.name = ""
        self.state = .running
    }
}




