//
//  CalcChatApp.swift
//  CalcChat
//
//  Created by Saidamir Navruzov on 06/09/2024.
//

import SwiftUI

@main
struct CalcChatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}


