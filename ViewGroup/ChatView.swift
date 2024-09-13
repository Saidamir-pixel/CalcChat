//
//  ChatView.swift
//  CalcChat
//
//  Created by Saidamir Navruzov on 06/09/2024.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("Чат")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
            }
        }
    }
}
