//
//  LoginView.swift
//  MySecureApp
//
//  Created by Zhaneordo on 1/29/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        VStack {
            Text("My Secure App")
                .font(.largeTitle)
                .accessibilityLabel("LogInPage")
            TextField("Email Address", text: $loginVM.credentials.email)
                .keyboardType(.emailAddress)
                .accessibilityLabel("LogInPage.emailAddress")
            SecureField("Password", text: $loginVM.credentials.password)
                .accessibilityLabel("LogInPage.password")
            
            if loginVM.showProgressView {
                ProgressView()
            }
            
            Button("Log In") {
                loginVM.login { success in
                    authentication.updateValidation(success: success)
                }
            }
            .disabled(loginVM.loginDisabled)
            .padding(.bottom, 20)
            .accessibilityLabel("LogInPage.logIn")
            
            Image("LaunchScreen")
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            Spacer()
        }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error) { error in
            Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
