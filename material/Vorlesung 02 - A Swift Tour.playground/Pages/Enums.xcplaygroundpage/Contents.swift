/*:
 Softwareentwicklung für iOS | Universität Heidelberg | SS 2016 | Nils Fischer | [ios-dev-kurs.github.io](ios-dev-kurs.github.io)
 
 ---
 
 ## Enums
 
 Enums repräsentieren eine Menge von _Fällen_ die sich gegenseitig ausschließen. Swift Enums sind sehr mächtig und können wie Klassen und Structs Methoden und _Computed Properties_ definieren.
*/
enum Gender {
    case female, male
    
    var description: String {
        // Das `switch` Statement eignet sich ideal für Enums:
        switch self {
        case .female: return "♀"
        case .male: return "♂"
        }
    }
}

var gender = Gender.female

// Swift's Type Inference ist insbesondere für Enums äußerst elegant. Der Typ kann weggelassen werden, wenn er im Kontext eindeutig ist:
gender = .male


import Foundation // Für `NSURL`

// Jeder Fall kann zusätzliche Informationen als _Associated Values_ tragen:
enum Contact {
    case phone(String), email(String), website(NSURL), post(Address)

    var description: String {
        switch self {
        case .phone(let phoneNumber): return "Phone <\(phoneNumber)>"
        case .email(let email): return "Email <\(email)>"
        case .website(let url): return "Website <\(url)>"
        case .post(let address): return "Post <\(address)>"
        }
    }
    
}

let contacts: [Contact] = [ .email("n.fischer@stud.uni-heidelberg.de"), .email("n.fischer@viwid.com"), .post(Address(street: "Im Neuenheimer Feld 227", postalCode: "", city: "Heidelberg")) ]
print(contacts)
