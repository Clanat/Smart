//
//  App.swift
//  Smart
//
//  Created by Nick Zatsepilov on 19/11/16.
//
//

import Foundation
import CGtk

class Application {
    static let instance = Application()
    
    private(set) var appWindowPtr: GtkApplicationWindowPtr!
    
    // MARK: - Lifecycle -
    
    private init() {
        gtk_init(nil, nil)
        setup()
    }
    
    deinit {
        clean()
    }
    
    private func setup() {
        guard let builderPtr = gtk_builder_new_from_file("ui.glade") else {
            fatalError("Failed creating gtk builder")
        }
        defer { g_object_unref(builderPtr) }
        
        gtk_builder_connect_signals(builderPtr, nil)
        
        guard let appWindowPtr = gtk_builder_get_object(builderPtr, "application_window") else {
            fatalError("Application window not found")
        }
        self.appWindowPtr = appWindowPtr.asApplicationWindow;
        
        guard let logBuffer = gtk_builder_get_object(builderPtr, "log_text_buffer") else {
            fatalError("Log text buffer not found")
        }
        
        Log.bind(buffer: logBuffer.asTextBuffer)
    }
    
    private func clean() {
        g_object_unref(appWindowPtr)
    }
    
    // MARK: - Public -
    
    func launch() {
        Log.info("Smart launched")
        Log.info("Smart launched")
        Log.info("Smart launched")
        Log.info("Smart launched")
        
        gtk_widget_show(appWindowPtr.asWidget)
        gtk_main()
    }
    
    
}
