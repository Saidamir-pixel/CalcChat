//
//  MainVew.swift
//  CalcChat
//
//  Created by Saidamir Navruzov on 06/09/2024.
//

import SwiftUI

struct MainView: View {
    let buttonsArr: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]

    @State private var chat: Bool = false

    @State private var value = "0"
    @State private var number: Double = 0.0
    @State private var currentOperation: Operation = .none
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                VStack (spacing: 10){
                    HStack{
                        if value == "333" {
                            NavigationLink(destination: ChatView()) {
                                Text("Chat")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color("grayCalcChat"))
                                    .cornerRadius(10)
                            }
                            .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text(value)
                            .foregroundColor(.white)
                            .font(.system(size: 85))
                            .fontWeight(.light)
                            .padding(.horizontal, 20)
                    }
                    Spacer()
                    
                    ForEach(buttonsArr, id: \.self) { row in
                        HStack(spacing: 10) {
                            ForEach(row, id: \.self) { item in
                                Button{
                                    self.didTap(item: item)
                                } label: {
                                    Text(item.rawValue)
                                        .frame(width: self.buttonWidth(item: item), height: 80)
                                        .foregroundColor(.white)
                                        .background(item.buttonColor)
                                        .font(.system(size: 30))
                                        .cornerRadius(5)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
    }
    //MARK: Tap button method
    func didTap(item: Buttons) {
        switch item {
            
        case .plus, .minus, .multiple, .divide:
            currentOperation = item.itemOperations()
            number = Double(value) ?? 0
            value = "0"
            
        case .clear:
            value = "0"
            
        case .negative:
            if let currentValue = Double(value) {
                value = formatResult(-currentValue)
            }
            
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100)
            }
            
        case .equal:
            if let currentValue = Double(value) {
                value = formatResult(performOperation(currentValue))
            }
            
        case .decimal:
            if !value.contains("."){
                value = "."
            }
        default:
            if value == "0"{
                value = item.rawValue
            }else{
                value += item.rawValue
            }
        }
    }
    
    //MARK: Helper Calculate Method
    func performOperation(_ currentValue: Double )-> Double {
        switch currentOperation{
        case .addition:
            return number + currentValue
        case .multiply:
            return number * currentValue
        case .subtract:
            return number - currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
    
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
    
    //MARK: Button size
    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = spacing * 5
        let zeroTotalSpacing = spacing * 4
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero {
            return (screenWidth - zeroTotalSpacing) / totalColumns * 2
        }
        
        return (screenWidth - totalSpacing) / totalColumns
    }
    
    func buttonHeight(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = spacing * 5
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        
        return (screenWidth - totalSpacing) / totalColumns
    }
    
        
}

#Preview {
    MainView()
}
