//
//  ContentView.swift
//  SimpleMVVMinSwiftUI
//
//  Created by Siddharth on 26/05/21.
//

import SwiftUI

//Model:
struct Person{
    // simple model creation using a struct.
    var name:String
    var birthday:Date
}

//ViewModel:
class viewModel:ObservableObject{
    //model is connected to the viewmodel.
    //@published is used so as to reflect the changes occcuring in the viewmodel property to the view side.
    @Published private var sid = Person(name: "Sid", birthday: Date())
    
    var name:String{
        sid.name
    }
    
    var age:String{
        // a func created to converted the dob -> age and provide a sting output.
        // we are simple returning a string value for demo.
        "30"
    }
    
    func changeName(_ name:String){
        sid.name = name
    }
    
}


//View:
struct ContentView: View {
    //Connect the view model to view.
    //Stateobject is used to observe the changes to the viewmodel.
    @StateObject var personViewModel = viewModel()
    var body: some View {
        VStack {
            Text(personViewModel.name)
                .padding()
                .font(.largeTitle)
            Text(personViewModel.age)
                .padding()
                .font(.largeTitle)
            Button(action: {
                //Inintiating action related to a change in name called referencing viewmodel class.
                personViewModel.changeName("Siddharh")
            }, label: {
                Text("Change Name")
                    .padding()
                    .font(.largeTitle)
            })
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
