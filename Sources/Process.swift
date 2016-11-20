//
//  Process.swift
//  Smart
//
//  Created by Nick Zatsepilov on 20/11/16.
//
//

import Foundation

typealias ProcessId = UInt

enum ProcessInfoFields: Int {
    case id
    case name
    case state
}

enum ProcessState: String {
    case running = "R"
    case sleeping = "S"
    case waiting = "D"
    case zombie = "Z"
    case stopped = "T"
    case dead = "X"
}

struct Process {
    
    let id: ProcessId
    let directoryPath: String
    let statFilePath: String
    let mapFilePath: String
    
    var isValid: Bool {
        let fileManager = FileManager.default
        let statFileReadable = fileManager.isReadableFile(atPath: self.statFilePath)
        let mapFileReadable = fileManager.isReadableFile(atPath: self.mapFilePath)
        
        return statFileReadable && mapFileReadable
    }
    
    var info: ProcessInfo? {
        return ProcessInfo(process: self)
    }
    
    init?(id: ProcessId) {
        self.id = id
        
        guard Process.isValid(id: id) else {
            print("Invalid process id")
            return nil
        }
        
        directoryPath = "/proc/\(id)/"
        statFilePath = directoryPath + "stat"
        mapFilePath = directoryPath + "map"
    }
    
    static func isValid(id: ProcessId) -> Bool {
        return FileManager.default.isReadableFile(atPath: "/proc/\(id)/stat")
    }
}

struct ProcessInfo {
    let process: Process
    private(set) var id: ProcessId!
    private(set) var name: String!
    private(set) var state: ProcessState!
    
    init?(process: Process) {
        guard process.isValid else {
            print("Invalid process")
            return nil
        }
        
        self.process = process
        
        do {
            let file = try String(contentsOfFile: process.statFilePath)
            let elements = file.components(separatedBy: " ")
            
            
            
            for i in 0...elements.count {
                let value = elements[i]
                
                guard let field = ProcessInfoFields(rawValue: i) else {
                    break
                }
                
                switch field {
                case .id:
                    self.id = ProcessId(value)!
                    break
                case .name:
                    self.name = value
                    break
                case .state:
                    self.state = ProcessState(rawValue: value)!
                    break
                }
            }
        } catch let error {
            print("Failed reading process stat file: \(error.localizedDescription)")
        }
    }
}




