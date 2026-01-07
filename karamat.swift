//
//  test2.swift
//  trainning
//
//  Created by Harshit Raj on 04/01/26.
//
import SwiftUI
struct Pet: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let type: String
}

let buddies = [
    Pet(name: "Rocky", description: "2-year-old Labrador, playful and loyal!", imageName: "Rocky", type: "dog"),
    Pet(name: "Misty", description: "3-year-old cat, calm and cuddly!", imageName: "Misty", type: "cat"),
    Pet(name: "Bruno", description: "1-year-old Beagle, full of energy!", imageName: "Bruno", type: "dog"),
    Pet(name: "Snowball", description: "1-year-old Rabbit, gentle and fluffy!", imageName: "Snowball",type: "Hare"),
    Pet(name: "Rio", description: "2-year-old Parrot, talkative and friendly!", imageName: "Rio", type: "parrot"),
    Pet(name: "Chubby", description: "6-month-old Hamster, tiny and cute!", imageName: "Chubby", type: "Mice"),
    Pet(name: "Bubble", description: "1-year-old Blue Platy, bright and lively!", imageName: "Bubble", type: "Guppy"),
    Pet(name: "Nugget", description: "1-year-old Sugar Glider , very cuddly!", imageName: "Nugget", type: "Sugar-Glider"),
    Pet(name: "Thunder", description: "4-year-old Horse, strong and affectionate!", imageName: "Thunder", type: "Horse"),
    Pet(name: "Quacky", description: "2-year-old Duck, funny and adorable!", imageName: "Quacky", type: "Duck"),
    Pet(name: "Milky", description: "3-year-old Goat, playful and friendly!", imageName: "Milky", type: "Goat"),
    Pet(name: "Skye", description: "2-year-old Pigeon, peaceful companion!", imageName: "skye", type: "Pigeon"),
    Pet(name: "Shellby", description: "15-year-old Turtle, calm and peaceful!", imageName: "Shellby.jpg", type: "turtle")
]

extension Color {
    static let Pink = Color(red: 0.85, green: 0.4, blue: 0.5)
    static let LightPink = Color(red: 1.0, green: 0.9, blue: 0.95)
    static let LightBlue = Color(red: 0.56, green: 0.83, blue: 0.99)
    static let Blue = Color(red: 26/255, green: 80/255, blue: 120/255)
}

struct button1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 150)
            .background(Color.Pink)
            .cornerRadius(25)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct FrontView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.LightPink.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("ADOPTBUDDIES")
                        .font(.system(size: 32, weight: .heavy, design: .rounded))
                        .foregroundColor(Color(red: 0.4, green: 0.1, blue: 0.2))
                        .padding(.top, 40)
                    Text("Find a Friend on Four Paws 🐾")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text("Adopt a loyal companion today ❤️")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    NavigationLink(destination: PetView()) {
                        Text("New Friends")
                    }
                    .buttonStyle(button1())
                    .padding(.vertical, 20)
                    Divider()
                    
                    VStack(spacing: 15) {
                        Text("Welcome to AdoptBuddies")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color.Pink)
                        
                        Image("home")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                        
                        NavigationLink(destination: ContactView()) {
                            HStack {
                                Image(systemName: "envelope.fill")
                                Text("Contact Us to Adopt")
                            }
                        }
                        .buttonStyle(button1())
                        .padding(.top, 30)
                        .padding(.bottom, 50)
                        
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct PetView: View {
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("Meet Our Buddies 🐾")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.Pink)
                        .padding()
                    
                    Text("Your best friend is waiting! Browse adorable pets ready to make your living home more loving and alive.")
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(.gray)
                    
                    LazyVStack(spacing: 20) {
                        ForEach(buddies) { pet in
                            PetSection(pet: pet)
                        }
                    }
                    .padding()
                    
                    NavigationLink(destination: ContactView()) {
                        HStack {
                            Image(systemName: "envelope.fill")
                            Text("Contact Us to Adopt")
                        }
                    }
                    .buttonStyle(button1())
                    .padding()
                }
            }
        }
    }
}

struct PetSection: View {
    let pet: Pet
    var body: some View {
        VStack {
            Image(pet.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(20)
                .frame(width:300,height: 320)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Text(pet.name)
                .font(.largeTitle)
                .padding(.top, 5)
            
            Text(pet.description)
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal, 5)
                .fixedSize(horizontal: false, vertical: true)
            
            NavigationLink(destination: AdoptPage(petName: pet.name)){
                Text("Adopt Me")
                    .font(.system(size:20))
                    .padding(8)
                    .frame(minWidth: 120)
                    .background(Color.Pink)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding(.bottom, 10)
            }
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct ContactView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    var body: some View {
        ZStack {
            Color.LightBlue.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 25) {
                    Text("Contact Us 📞")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 30)
                    
                    VStack(spacing: 15) {
                        TextFieldStyle(placeholder: "Enter Your Name", text: $name)

                        TextFieldStyle(placeholder: "Enter Your Email-ID", text: $email)
                        ZStack(alignment: .topLeading) {
                            if message.isEmpty {
                                Text("Enter Your Message")
                                    .foregroundColor(.gray)
                                    .padding(12)
                            }
                            TextEditor(text: $message)
                                .frame(height: 120)
                                .padding(4)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.LightBlue.opacity(0.4), lineWidth: 1))
                        }
                    }
                    .padding()
                    
                    Button("Send Message") {
                        print("Message Sent!")
                    }
                    .buttonStyle(button2())
                    
                    Spacer(minLength: 50)
                    VStack(spacing: 10) {
                        Text("About AdoptBuddies")
                            .font(.title2)
                            .bold()
                        
                        Text("We connect adorable pets with loving families.\nEvery adoption helps us create a happier world.")
                            .multilineTextAlignment(.center)
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        Text("You Happy + Pet Happy = Us Happy 🧡")
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                    .padding()
                }
            }
        }
    }
}

struct TextFieldStyle: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.Pink, lineWidth: 1)
            )
    }
}

struct button2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 150)
            .background(Color.Blue)
            .cornerRadius(25)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct AdoptPage: View {
    @State private var petName: String
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var reason: String = ""
    init(petName: String) {
        _petName = State(initialValue: petName)
    }
    var body: some View{
        ZStack{
            Color.LightBlue.ignoresSafeArea()
            ScrollView{
                VStack(spacing: 20){
                    Text("Adoption Form📋")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top,20)
                        .foregroundColor(Color.black.opacity(0.6))
                    Text("You are one step away from bringing\nYOUR BEST FRIEND")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    VStack(spacing: 10){
                        TextFieldStyle(placeholder: "Pet Name", text:$petName)
                        TextFieldStyle(placeholder: "Your Name", text: $name)
                        TextFieldStyle(placeholder: "Your Address", text: $address)
                        ZStack(alignment: .topLeading){
                            TextEditor(text: $reason)
                                .frame(height: 100)
                                .padding(4)
                                .cornerRadius(10)
                                .background(Color.white)
                            if reason.isEmpty {
                                Text("Why you want to Adopt")
                                    .foregroundColor(.red)
                                    .bold()
                            }
                        }
                    }
                    .padding()
                    
                    Button("Sumbit Application"){}
                    .buttonStyle(button2())
                    .padding(.bottom,20)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    FrontView()
}
