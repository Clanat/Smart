//
//  MemoryRegion.swift
//  Smart
//
//  Created by Nick Zatsepilov on 20/11/16.
//
//

import Foundation

enum MemoryRegionAccess: String {
    case read = "r"
    case write = "w"
    case execute = "x"
    case shared = "s"
    case private_ = "p"
}

enum MemoryRegionField: Int {
    case adressSpace
    case permissions
    case offset
    case device
    case iNode
    case path
}

struct MemoryRegion {
    
    
    let memorySpace: Range<UInt>
    let offset: UInt
    let deviceMinor: UInt16
    let deviceMajor: UInt16
    let iNode: UInt
    let permissions: [MemoryRegionAccess]
    
    private let path: String
    
//    static func find(mapFilePath: String, address: UInt) -> MemoryRegion? {
//        guard FileManager.default.isReadableFile(atPath: mapFilePath) else {
//            return nil
//        }
//        
//        do {
//            let lines = try String(contentsOfFile: mapFilePath).components(separatedBy: .newlines)
//            
//            for line in lines {
//                let elements = line.components(separatedBy: .whitespaces)
//                for i in 0...elements.count {
//                    guard let field = MemoryRegionField(rawValue: i) else {
//                        continue
//                    }
//                    
//                    switch field {
//                    case .:
//                        <#code#>
//                    default:
//                        <#code#>
//                    }
//                }
//                
//            }
//            
//        } catch {
//            print("Unable to read map file: \(mapFilePath)")
//        }
//        
//        return nil
//    }
}
















