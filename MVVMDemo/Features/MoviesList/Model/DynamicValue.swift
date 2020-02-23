//
//  DynamicValue.swift
//  MVVMDemo
//
//  Created by Mohammed Khaled on 02/22/20.
//  Copyright © 2020 Mohammed Khaled. All rights reserved.
//

import Foundation

class DynamicValue<T> {
    
    typealias CompletionHandler = ((T) -> Void)
    
    private var observers = [String: CompletionHandler]()
    
    var value: T {
        didSet {
            self.notify()
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    deinit {
        observers.removeAll()
    }
    
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
}
