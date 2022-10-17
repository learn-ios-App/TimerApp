//
//  SettingView.swift
//  TimerApp
//
//  Created by 渡邊魁優 on 2022/10/17.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("timerValueKey") var timerValue = 10
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(timerValue)秒")
                .font(.largeTitle)
            Spacer()
            Picker(selection: $timerValue) {
                Text("10秒")
                    .tag(10)
                Text("20秒")
                    .tag(20)
                Text("30秒")
                    .tag(30)
                Text("40秒")
                    .tag(40)
                Text("50秒")
                    .tag(50)
                Text("60秒")
                    .tag(60)
                Text("120秒")
                    .tag(120)
                Text("180秒")
                    .tag(180)
                Text("240秒")
                    .tag(240)
                Text("300秒")
                    .tag(300)
            } label: {
                Text("選択")
            }
            .pickerStyle(.wheel)
            Spacer()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
