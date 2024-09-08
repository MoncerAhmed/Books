//
//  MicroLogger.swift
//  Books
//
//  Created by Ahmed Moncer on 06/09/2024.
//

import os.log

typealias Micro = MicroLogger

enum MicroLogger {

    static func log(_ message: String) {
        print("""

            📩 ===========================
            \(message)
            📩 ===========================

            """)
    }

    static func logError(_ error: String) {
        print("""
            🔴❗️ ===========================
            \(error)
            🔴❗️ ===========================

            """)
    }

    static func logError(_ error: Error) {
        self.logError(String(describing: error))
    }
}
