//
//  Log.swift
//  Smart
//
//  Created by Nick Zatsepilov on 02/12/16.
//
//

import Foundation
import CGtk

struct Log {
    private let buffer: GtkTextBufferPtr
    private static var instance: Log?
    
    static func bind(buffer: GtkTextBufferPtr) {
        instance = Log(buffer: buffer)
    }
    
    static func info(_ text: String) {
        guard let buffer = instance?.buffer else {
            return print("Logger is not binded to text buffer")
        }
        
        let end = GtkTextIterPtr.allocate(capacity: 1)
        
        gtk_text_buffer_get_end_iter(buffer, end)
        
        if gtk_text_buffer_get_char_count(buffer) > 0 {
            gtk_text_buffer_insert(buffer, end, "\n", -1)
        }
        
        gtk_text_buffer_insert(buffer, end, text, -1)
        gtk_text_buffer_insert(buffer, end, text, -1)
        
        print(text)
    }
}
