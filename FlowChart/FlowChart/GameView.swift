//
//  GameView.swift
//  FlowChart
//
//  Created by Michael Durkin on 12/20/21.
//

import SwiftUI

struct GameView: View {
    @State var taskname = ""
    @State private var showingGame = false
    //    private let locationManager = CLLocationManager()
    
    //    @IBOutlet weak var questionCounter: UILabel!
    let allQuestions = QuestionBank()
    @State var questionNumber: Int = 0
    //    @State var a: Int = 1
    var selectedAnswer: Int = 0
    @State var textToUpdate = "In a rush?"
    @State var shouldHide = false
    
    var body: some View {
        
        ZStack{
            
            Color.black.foregroundColor(Color.white).ignoresSafeArea(.all)
            
            //            self.background(Color.black)
            //            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
            //                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("What task is to be done?")
                
                //                        .font(.system(size: 20, weight: .bold, design: .default))
                    .font(.system(size: 24, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .offset(y:-20)
                
                Section{
                    TextField("", text: $taskname)
                        .background(Color.white.cornerRadius(10))
                        .padding(EdgeInsets(top: 20, leading: 40, bottom: 45, trailing: 40))                            .textFieldStyle(.roundedBorder)
                        .font(.headline)
                    
                }
                
                HStack (spacing: 20)
                {
                    
                    NavigationLink(destination: QuestionView(), isActive: $showingGame, label: {
                        Button(action: {
                            self.showingGame.toggle()
                        }) {
                            Text("Run")
                                .frame(width: 100, height:50)
                                .background(Color.red)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(Color.white)
                                .cornerRadius(3.0)
                        }
                        //                        .sheet(isPresented: $showingGame) {
                        ////                            QuestionView().edgesIgnoringSafeArea(.all)
                        ////                                .statusBar(hidden: true)
                        //
                        //                        }.statusBar(hidden: true)
                        
                    })
                }
            }.offset(y:-60)
            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
