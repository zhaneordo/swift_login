//
//  LoginView.swift
//  MySecureApp
//
//  Created by Zhaneordo on 1/29/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("My Secure App")
                .font(.largeTitle)
            TextField("Email Address", text: $loginVM.credentials.email)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $loginVM.credentials.password)
            
            if loginVM.showProgressView {
                ProgressView()
            }
            
            Button("Log In") {
                loginVM.login { success in }
            }
            .disabled(loginVM.loginDisabled)
            .padding(.bottom, 20)
            Image("LauchScreen")
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            Spacer()
        }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .disabled(loginVM.showProgressView)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
