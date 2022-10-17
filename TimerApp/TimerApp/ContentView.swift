//
//  ContentView.swift
//  TimerApp
//
//  Created by 渡邊魁優 on 2022/10/17.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler : Timer?
    @State var count = 0
    @AppStorage("timerValueKey") var timerValue = 50
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text(String(timerValue - count))
                    .font(.largeTitle)
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        startTimer()
                    }) {
                        Text("スタート")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 140, height: 140)
                            .background(Color("startColor"))
                        //円形に切り抜く
                            .clipShape(Circle())
//                            .padding()
                    }
                    .background(Color.red)
                    .clipShape(Circle())
                    
                    Spacer()
                    Button(action: {
                        if let unwrapedTimerHandler = timerHandler {
                            if unwrapedTimerHandler.isValid == true {
                                unwrapedTimerHandler.invalidate()
                            }
                        }
                    }) {
                        Text("ストップ")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 140, height: 140)
                            .background(Color("stopColor"))
                        //円形に切り抜く
                            .clipShape(Circle())
//                            .padding()
                    }
                    .background(Color.blue)
                    .clipShape(Circle())
                    Spacer()
                }
                Spacer()
                    .onAppear {
                        count = 0
                    }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView()) {
                        Text("秒数設定")
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("終了"),
                      message: Text("タイマー終了時刻です"),
                      dismissButton: .default(Text("OK")))
            }
        }
        //iPadに対応させる
        .navigationViewStyle(StackNavigationViewStyle())
    }
    func countDownTimer() {
        count += 1
        
        if timerValue - count <= 0 {
            timerHandler?.invalidate()
            showAlert = true
        }
    }
    func startTimer() {
        if let unwrapedTimerHandler = timerHandler {
            if unwrapedTimerHandler.isValid == true {
                return
            }
        }
        if timerValue - count <= 0 {
            count = 0
        }
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            countDownTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
