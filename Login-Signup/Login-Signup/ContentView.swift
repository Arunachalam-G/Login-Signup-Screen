//
//  ContentView.swift
//  OffSetShapes
//
//  Created by Arunachalam Ganesan on 08/01/22.
//

import SwiftUI

enum AppViews {
    case LoginView
    case SignupView
}

class ShowingView: ObservableObject {
    
    init(showingView: AppViews) {
        self.viewId = showingView
    }
    
    @Published var viewId : AppViews
}

struct ContentView: View {
    @State private var username: String = "arun@gmail.com"
    @State private var password: String = "test@123"
    @ObservedObject var showingView: ShowingView
    var body: some View {
        if showingView.viewId == .SignupView {
            SignUpView(showingView: ShowingView(showingView: .SignupView))
        } else {
            ZStack {
                Color(kDarkBlue)
                    .ignoresSafeArea()
                
                MyCircle(color: kYellow)
                    .position()
                
                Group {
                    MyCircle(color: kOrange, width: 120)
                        .offset(x: -200, y: -170)
                    MyCircle(color: kIndigo, width: 75)
                        .offset(x: -120, y: -170)
                    MyCircle(color: kGreen, width: 100)
                        .offset(x: -30, y: -290)
                    Capsule()
                        .foregroundColor(Color(kIndigo))
                        .frame(width: 120, height: 260)
                        .offset(x: -30, y: -450)
                    MyCircle(color: kOrange, width: 120)
                        .offset(x: -30, y: -370)
                    MyCircle(color: kPink, width: 190)
                        .offset(x: 134, y: -400)
                    ClippedCircle(color: kYellow, x: -80)
                        .offset(x: 220, y: -165)
                    ClippedCircle(color: kWhite, x: 80)
                        .offset(x: 60, y: -165)
                    MyCircle(color: kGreen, width: 160)
                        .offset(x: 134, y: -260)
                }
               
                VStack() {
                    
                    VStack(alignment: .leading) {
                        Text("Welcome")
                            .font(Font.custom(kPacificoRegular, size: 35))
                            .foregroundColor(Color(kWhite))
                        Text("Back")
                            .font(Font.custom(kPacificoRegular, size: 35))
                            .foregroundColor(Color(kWhite))
                            .offset(y: -15)
                            .padding(.bottom, 15)
                        MyTextField(myText: $username, placeHolder: "arun@gmail.com")
                            .padding(.bottom, 20)
                        SecureField("password", text: $password)
                            .foregroundColor(Color(kWhite))
                            .font(Font.custom("Oswald-Regular", size: 20))
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                            .frame(height: 50)
                            .background(Color(kTextFieldColor))
                            .cornerRadius(25)
                            .padding(.trailing, 18)
                    }
                    .padding(.top, 360)
                    .padding(.leading, 18)
                    
                    VStack(alignment: .trailing) {
                        Text("Forgot password?")
                            .font(Font.custom(kOswaldRegular, size: 20))
                            .foregroundColor(Color(kWhite))
                    }
                    .padding(.leading, 260)
                    .padding(.bottom, 20)
                    
                    Text("Login")
                        .font(.system(size: 25))
                        .foregroundColor(Color(kWhite))
                        .frame(width: 120, height: 50)
                        .background(Color(kOrange))
                        .cornerRadius(25)
                    
                    Spacer()
                    
                    HStack {
                        Text("New User ?")
                            .font(Font.custom(kOswaldRegular, size: 20))
                            .foregroundColor(Color(kWhite))
                        Text("Signup")
                            .font(Font.custom(kOswaldRegular, size: 22))
                            .foregroundColor(Color(kOrange))
                            .onTapGesture {
                                showingView.viewId = .SignupView
                            }
                    }
                    .padding(.top, 10)
                }
            }
        }
    }
}

struct ClippedCircle: View {
    var color: String
    var x: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(color))
                .frame(width: 160)
            
            Circle()
                .fill(Color(kGreen))
                .frame(width: 160)
                .offset(x: x, y: 64)
        }
        .frame(width: 160, height: 160)
        .foregroundColor(.white)
        .cornerRadius(80)
    }
}

struct MyCircle: View {
    var color: String
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        Circle()
            .foregroundColor(Color(color))
            .frame(width: width, height: height)
    }
}

struct MyTextField: View {
    @Binding var myText: String
    var placeHolder: String?
    var isPhone: Bool?
    
    var body: some View {
        TextField(placeHolder ?? "", text: $myText)
            .foregroundColor(Color(kWhite))
            .font(Font.custom("Oswald-Regular", size: 20))
            .padding(EdgeInsets(top: 0, leading: isPhone == true ? 100 : 16, bottom: 0, trailing: 0))
            .frame(height: 50)
            .background(Color(kTextFieldColor))
            .cornerRadius(25)
            .padding(.trailing, 18)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(showingView: ShowingView(showingView: .LoginView))
    }
}

