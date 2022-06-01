//
//  LocationRequstView.swift
//  FlowChart
//
//  Created by Michael Durkin on 12/20/21.
//

import SwiftUI

struct LocationRequstView: View {
    
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
        
        ZStack
        {
            Color(.systemRed).ignoresSafeArea()
            VStack{
//                Image(systemName: "paperplane.circle.fill")
//                    .resizable().scaledToFit().frame(width: 100, height: 100)
//                    .padding(.bottom, 32)
//                    .foregroundColor(Color.white)
                
                Text("FOR BEST RESULTS PLEASE CONFIRM ACCESS TO LOCATION USE AND CONTACTS")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding().offset(y: -20)
                
                VStack{
                    NavigationLink(destination: GameView(), isActive: $showingGame, label: {
                        Button(action: {
                            self.showingGame.toggle()
                        }) {
                            Text("Allow Location & Contacts").padding().font(.headline)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .padding(.horizontal, -32)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                        //                        .sheet(isPresented: $showingGame) {
                        ////                            QuestionView().edgesIgnoringSafeArea(.all)
                        ////                                .statusBar(hidden: true)
                        //
                        //                        }.statusBar(hidden: true)
                        
                    })
                    
                    //                    Button{
                    //                        print("")
                    //                    } label: {
                    //                        Text("Allow location").padding().font(.headline)
                    //                    }
                    
                    
                }
            }
            .padding().offset(y: -70)

            
        }
    }
}

struct LocationRequstView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequstView()
    }
}
