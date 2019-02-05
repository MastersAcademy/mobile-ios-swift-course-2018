import Foundation

protocol ObserverProtocol: class {
}

final class Observable<T> {
    
    init(_ value: T) {
        self._value = value
    }
    
    var value: T {
        get {
            return self._value
        }
        set {
            self.setValue(newValue)
        }
    }
    
    func observe(_ closure: @escaping (_ old: T, _ new: T) -> Void) -> ObserverProtocol {
        let observer = Observer(closure: closure)
        self.observers.append(observer)
        return ObserverWrapper(observer: observer, onDeinit: { [weak self] observer in
            self?.removeObserver(observer)
        })
    }
    
    func observeNewAndCall(_ closure: @escaping (_ new: T) -> Void) -> ObserverProtocol {
        let observer = self.observe { _, new in
            closure(new)
        }
        closure(self.value)
        return observer
    }
    
    // MARK: - Helpers
    private var _value: T
    private lazy var observers = [Observer<T>]()
    
    private func setValue(_ value: T) {
        let oldValue = self._value
        self._value = value
        
        for observer in self.observers {
            observer.closure(oldValue, self.value)
        }
    }
    
    fileprivate func removeObserver(_ observer: Observer<T>) {
        self.observers = self.observers.filter { $0 !== observer }
    }
}

private class Observer<T> {
    let closure: (_ old: T, _ new: T) -> Void
    init (closure: @escaping (_ old: T, _ new: T) -> Void) {
        self.closure = closure
    }
}

private class ObserverWrapper<T>: ObserverProtocol {
    let observer: Observer<T>
    let onDeinit: (Observer<T>) -> Void
    
    init(observer: Observer<T>, onDeinit: @escaping (Observer<T>) -> Void) {
        self.observer = observer
        self.onDeinit = onDeinit
    }
    
    deinit {
        self.onDeinit(self.observer)
    }
}
