//
//  Pointers.swift
//  Smart
//
//  Created by Nick Zatsepilov on 02/12/16.
//
//

import Foundation
import CGtk

enum ConnectFlags {
    case after
    case swapped
    
    var gConnectFlags: GConnectFlags {
        switch self {
        case .after: return G_CONNECT_AFTER
        case .swapped: return G_CONNECT_SWAPPED
        }
    }
}

typealias HandlerId = UInt

struct SignalConnection {
    let name: String
    let data: UnsafeMutableRawPointer?
    let handler: GCallback
    let connectFlags: ConnectFlags
}

extension UnsafeMutablePointer {
    func connectSignal(connection: SignalConnection) -> HandlerId {
        return g_signal_connect_data(self, connection.name,
                                     connection.handler,
                                     connection.data, nil,
                                     connection.connectFlags.gConnectFlags)
    }
    
    func disconnectSignal(handlerId id: HandlerId) {
        g_signal_handler_disconnect(self, id)
    }
}
