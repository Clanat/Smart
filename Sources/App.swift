//
//  App.swift
//  Smart
//
//  Created by Nick Zatsepilov on 19/11/16.
//
//

import Foundation

class App {
    private(set) static var isRunning = false
    
    static func run(arguments: [String]) {
        guard !isRunning else { return }
        
        isRunning = true
        
        while isRunning {
            print("Smart > ", separator: "", terminator: "")
            
            if let command = readLine() {
                
                switch command {
                case "exit":
                    return terminate()
                default:
                    print("Smart: unknown command")
                }
            }
        }
    }
    
    static func terminate() {
        guard isRunning else { return }
        
        isRunning = false
    }
    
}
