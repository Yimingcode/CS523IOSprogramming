import Cocoa

// lazy var
struct InterviewCandidate{
    var isiOS:Bool?
    
    lazy var iOSResumeDescription: String = {
        return "I am an iOS developer"
    }()
    lazy var androidResumeDescription: String = {
        return "I am an android developer"
    }()
}

var person1 = InterviewCandidate()
person1.isiOS = true

if person1.isiOS!{
    print(person1.iOSResumeDescription)
} else {
    print(person1.androidResumeDescription)
}
