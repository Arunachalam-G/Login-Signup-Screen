//
//  SignUpView.swift
//  OffSetShapes
//
//  Created by Arunachalam Ganesan on 09/01/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = "Arun"
    @State private var lastName: String = "G"
    @State private var email: String = "arun@gmail.com"
    @State private var countryCode: String = "+91"
    @State private var phoneNumber: String = "9087654323"
    @State private var center: String = "Select Center"
    
    @ObservedObject var showingView: ShowingView
    
    var body: some View {
        if showingView.viewId == .LoginView {
            ContentView(showingView: ShowingView(showingView: .LoginView))
        } else {
            ZStack {
                MyCircle(color: kOrange, width: 140)
                    .offset(x: -200, y: 430)
                MyCircle(color: kYellow, width: 140)
                    .offset(x: 200, y: 470)
                
                VStack(alignment: .leading) {
                    Text("Hello...!")
                        .font(Font.custom(kPacificoRegular, size: 35))
                        .foregroundColor(Color(kWhite))
                        .padding(.top, 40)
                        .padding(.leading, 18)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        MyTextField(myText: $firstName, placeHolder: "Arun")
                        MyTextField(myText: $lastName, placeHolder: "G")
                        MyTextField(myText: $email, placeHolder: "arun@gmail.com")
                        ZStack(alignment: .leading) {
                            MyTextField(myText: $phoneNumber, placeHolder: "9092272932", isPhone: true)
                            TextField("+44", text: $countryCode)
                                .foregroundColor(Color(kWhite))
                                .font(Font.custom(kOswaldRegular, size: 20))
                                .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                                .frame(width: 80, height: 50)
                                .background(Color(kTextFieldColor2))
                                .cornerRadius(25)
                                .padding(.trailing, 18)
                        }
                        MyTextField(myText: $center, placeHolder: "Select center")
                    }
                    .padding(.leading, 18)
                    
                    HStack {
                        Spacer()
                        Text("Signup")
                            .font(.system(size: 25))
                            .foregroundColor(Color(kWhite))
                            .frame(width: 120, height: 50)
                            .background(Color(kOrange))
                            .cornerRadius(25)
                        Spacer()
                    }
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("Already Have Account ?")
                            .font(Font.custom(kOswaldRegular, size: 20))
                            .foregroundColor(Color(kWhite))
                        Text("Login")
                            .font(Font.custom(kOswaldRegular, size: 22))
                            .foregroundColor(Color(kOrange))
                            .onTapGesture {
                                showingView.viewId = .LoginView
                            }
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(kDarkBlue).ignoresSafeArea())
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(showingView: ShowingView(showingView: .SignupView))
    }
}

