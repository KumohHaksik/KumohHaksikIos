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
    
    public func info(_ items : Any...){
        print(info: .info, items)
    }
    
    public func error(_ items : Any...){
        print(info: .error, items)
    }
    
    public func warn(_ items : Any...){
        print(info:.warn, items)
    }
    
    public func deubug(_ items : Any...){
        print(info: .debug, items)
    }
    
    init(){
        formatter.dateFormat = "MM-dd HH:mm:ss"
    }
    
    private func print(info: LoggerInfo,_ items: Any...) {
        if(info == .debug){
            #if DEBUG
            let output = items.map { "\($0)" }.joined(separator: " ")
            Swift.print("[\(info):\(loggerTime())]: \(output)")
            #endif
        }else{
            let output = items.map { "\($0)" }.joined(separator: " ")
            Swift.print("[\(info):\(loggerTime())]: \(output)")
        }
        
        

    }
    
    private func loggerTime() -> String {
        return formatter.string(from: Date())
    }
}

