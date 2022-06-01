//
//  ContentView.swift
//  FlowChart
//
//  Created by Michael Durkin on 12/17/21.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager.shared
    
    @State var taskname = ""
    @State private var showingGame = false
    
    //    @IBOutlet weak var questionCounter: UILabel!
    let allQuestions = QuestionBank()
    @State var questionNumber: Int = 0

    var selectedAnswer: Int = 0
    @State var textToUpdate = "In a rush?"
    @State var shouldHide = false
    func updateQuestion(){
        
        if questionNumber <= allQuestions.list.count - 2{
            self.textToUpdate = allQuestions.list[questionNumber].question
            
        }
        else  if questionNumber <= allQuestions.list.count - 1{
            
        }
    }
    class StatusBarHideHelper: UIViewController {
        override var prefersStatusBarHidden: Bool { true }    // << important !!
    }
    
    struct StatusBarHideHelperView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            StatusBarHideHelper()
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    var body: some View {
    
        NavigationView
        {
            
            
            Group {
                if locationManager.userLocation == nil {
                    LocationRequstView()
                    
                }
                else{
                    Text("Hello")
                }
            }
        }
        
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .statusBar(hidden: true)
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
