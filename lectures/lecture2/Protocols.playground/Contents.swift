import Foundation

protocol Trainable {
    func train()
}

class Student: Trainable, CustomStringConvertible {
    var firstname: String
    var lastname:  String
    var className: String
    
    init(withFitstName firstname: String, lastname: String, andClassName className: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.className = className
    }
    
    func train() {
        print("Training...")
    }
    
    var description: String {
        return "Student: \(self.firstname) \(self.lastname). Class: \(self.className)."
    }
}


protocol DoingNothing {
    func doNothing()
}

extension DoingNothing {
    // default implementaion
    func doNothing() {
        print("🤤")
    }
}

class UselessStudent: Student, DoingNothing {
    
    override func train() {
        doNothing()
    }
}


let student = Student(withFitstName: "Bob", lastname: "Nicestudent", andClassName: "ZPS-111")
let uselessStudent = UselessStudent(withFitstName: "Alice", lastname: "Uslessstudent", andClassName: "ZPS-111")

print("Going to train - \(student)")
student.train()


print("Going to train - \(uselessStudent)")
uselessStudent.train()


protocol Academy {
    var trainableObjects: [Trainable] { get }
    
    func startSeason(withTrainableObjects: [Trainable])
    
    func train()
}


class CleaningAcademy: Academy {
    var trainableObjects: [Trainable] = []
    
    func startSeason(withTrainableObjects trainableObjects: [Trainable]) {
        self.trainableObjects = trainableObjects
    }
    
    func train() {
        print("Starting our training...\n")
        for trainee in self.trainableObjects {
            print("Going to train - \(trainee)")
            trainee.train()
            print()
        }
    }
}


let cleaningAcademy = CleaningAcademy()
cleaningAcademy.startSeason(withTrainableObjects: [
    Student(withFitstName: "Bob", lastname: "Nicestudent", andClassName: "ZPS-111"),
    UselessStudent(withFitstName: "Alice", lastname: "Uslessstudent", andClassName: "ZPS-111")
    ])

cleaningAcademy.train()

print("===========")

class PoliceAcademy: Academy {
    var trainableObjects: [Trainable] = []
    
    func startSeason(withTrainableObjects trainableObjects: [Trainable]) {
        self.trainableObjects = trainableObjects
    }
    
    func train() {
        print("Starting our training...\n")
        for trainee in self.trainableObjects {
            print("Going to train - \(trainee)")
            trainee.train()
            print()
        }
    }
}

class Dog: Trainable, CustomStringConvertible {
    
    var name:  String
    
    init(withName name: String) {
        self.name = name
    }
    
    func train() {
        print("Training...")
    }
    
    var description: String {
        return "Dog: \(self.name)."
    }
}

class LazyDog: Dog, DoingNothing {
    
    override func train() {
        doNothing()
    }
}

let policeAcademy = PoliceAcademy()
policeAcademy.startSeason(withTrainableObjects: [
    
    Student(withFitstName: "Bob", lastname: "Nicestudent", andClassName: "ZPS-111"),
    Student(withFitstName: "Lisa", lastname: "Nicestudent", andClassName: "ZPS-111"),
    Dog(withName: "Sharik"),
    LazyDog(withName: "Bobik"),
    
    ])

policeAcademy.train()
