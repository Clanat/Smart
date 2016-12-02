//
//  GtkPointers.swift
//  Smart
//
//  Created by Nick Zatsepilov on 02/12/16.
//
//

import Foundation
import CGtk

typealias GObjectPtr = UnsafeMutablePointer<GObject>

typealias GtkApplicationWindowPtr = UnsafeMutablePointer<GtkApplicationWindow>
typealias GtkWindowPtr = UnsafeMutablePointer<GtkWindow>

typealias GtkWidgetPtr = UnsafeMutablePointer<GtkWidget>

typealias GtkTextBufferPtr = UnsafeMutablePointer<GtkTextBuffer>
typealias GtkTextIterPtr = UnsafeMutablePointer<GtkTextIter>


extension UnsafeMutablePointer {
    // TODO: validation before casting
    
    var asGObject: GObjectPtr {
        return unsafeBitCast(self, to: GObjectPtr.self)
    }
    
    var asApplicationWindow: GtkApplicationWindowPtr {
        return unsafeBitCast(self, to: GtkApplicationWindowPtr.self)
    }
    
    var asWindow: GtkApplicationWindowPtr {
        return unsafeBitCast(self, to: GtkApplicationWindowPtr.self)
    }
    
    var asWidget: GtkWidgetPtr {
        return unsafeBitCast(self, to: GtkWidgetPtr.self)
    }
    
    var asTextBuffer: GtkTextBufferPtr {
        return unsafeBitCast(self, to: GtkTextBufferPtr.self)
    }
}
