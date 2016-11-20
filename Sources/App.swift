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
    
    enum Command: String {
        case help = "help"
        case exit = "exit"
        case attach = "attach"
    }
    
    private static let commands: [Command : String] = [
        Command.help : "Print help",
        Command.exit : "Exit",
        Command.attach : "Attach to wow process, usage: [attach process_id]"
    ]
    
    static func run(arguments: [String]) {
        guard !isRunning else { return }
        
        isRunning = true
        
        while isRunning {
            print("Smart > ", separator: "", terminator: "")
            processInput(line: readLine())
        }
    }
    
    private static func processInput(line: String?) {
        guard let args = line?.components(separatedBy: ""), args.count > 0 else {
            print("Invalid command")
            return
        }
        
        guard let firstArg = args.first, let command = Command(rawValue: firstArg) else {
            return print("Unknown command")
        }
        
        switch command {
        case .exit:
            return handleExitCommand()
        case .help:
            return handleHelpCommand()
        case .attach:
            return handleAttachCommand(args: args)
        }
    }
    
    static func handleExitCommand() {
        guard isRunning else { return }
        
        isRunning = false
    }
    
    static func handleHelpCommand() {
        print("Commands:")
        for key in commands.keys {
            print(" \(key) - \(commands[key]!)")
        }
    }
    
    static func handleAttachCommand(args: [String]) {
        guard args.count > 1 else {
            return
        }
        
        guard let id = ProcessId(args[1]), let process = Process(id: id), let info = process.info else {
            return print("Invalid process id")
        }
        
        print("Attached to \(info.name) [\(id)]")
    }

}
