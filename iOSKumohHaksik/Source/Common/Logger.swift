//
//  Logger.swift
//  iOSKumohHaksik
//
//  Created by 신효성 on 5/25/24.
//

import Foundation

public enum LoggerInfo {
  case info
  case error
  case warn
  case debug
}

public var logger = Logger()

public class Logger {

  private let formatter = DateFormatter()

  public func info(_ items: Any...) {
    message(.info, items)
  }

  public func error(_ items: Any...) {
    message(.error, items)
  }

  public func warn(_ items: Any...) {
    message(.warn, items)
  }
    
    
  public func deubug(_ items: Any...) {
    #if DEBUG
      message(.debug, items)
    #endif
  }

  init() {
    formatter.dateFormat = "MM-dd HH:mm:ss"
  }

  private func message(_ info: LoggerInfo, _ items: Any...) {
    let output = items.map { "\($0)" }.joined(separator: " | ")
    print("[\(info):\(loggerTime())]: \(output)")
  }

  private func loggerTime() -> String {
    return formatter.string(from: Date())
  }
}
