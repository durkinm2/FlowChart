//
//  QuestionView.swift
//  FlowChart
//
//  Created by Michael Durkin on 12/17/21.
//

import SwiftUI
//import iosMath

struct QuestionView: View {

    let allQuestions = QuestionBank()
    @State var questionNumber: Int = 0
    var selectedAnswer: Int = 0
    @State var textToUpdate = "In a rush?"
    @State var subjectToUpdate = ""
//    var subjectIndent: CGFloat = -5
    @State var subjectIndent: CGFloat = -5.0

    @State var shouldHide = false
    func updateQuestion(){
        
        if(questionNumber > 0)
        {
            subjectIndent = -6

        }
        else
        {
            subjectIndent = -5

        }
        
        if questionNumber <= allQuestions.list.count - 2{
            self.textToUpdate = allQuestions.list[questionNumber].question
            self.subjectToUpdate = allQuestions.list[questionNumber].subject
        }
        else  if questionNumber <= allQuestions.list.count - 1{
            
        }
    }
    
    
    var body: some View {
        
        
        
        ZStack{
            
            
            Color.black.foregroundColor(Color.white).ignoresSafeArea(.all)
            //            self.background(Color.black)
            //            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
            //                .edgesIgnoringSafeArea(.all)
            
//            let underlineAttr = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
//            let unstr = NSMutableAttributedString.init(string: "T=800 * Mjt")
//            unstr.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: unstr.length));
//            let label01 = UILabel()
//            label01.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
//            label01.attributedText = unstr;
            
            
            VStack{
                Text("Best solution for fixing water heater")
                    .font(.system(size: 22, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .cornerRadius(3.0)
                    .offset(y: -100)
                Text("T =  800 * MJT").italic()
                    .font(.system(size: 24, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .cornerRadius(3.0)
                    .padding(.bottom, 6)
                    .padding(.trailing, 36)
                    .overlay(
                        VStack{
                        Spacer()
                            Rectangle().frame(width: 114, height: 2).padding(.leading, 16).foregroundColor(Color.white)
                    })
                    //.underline(true, color: Color.white)
                Text("2L").italic()
                    .font(.system(size: 24, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .cornerRadius(3.0)
                    .padding(.bottom, 58)
                Text("Thanks for choosing Flowchart, Tim.")
                    .padding()
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundColor(Color.white)
                    .cornerRadius(3.0)
                Image("downchevron").aspectRatio(contentMode: .fit)
                //                Image(systemName: "exclamationmark.octagon")
                
            }.opacity(self.shouldHide ? 0 : 1)
            
            VStack{
                
                
                HStack{
                    
                    Text(self.textToUpdate)
                        .font(.system(size: 24, weight: .medium, design: .default))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .offset( y: -60)
                        .opacity(self.shouldHide ? 0 : 1)

                    
                    Text(self.subjectToUpdate).italic()
                        .font(.system(size: 24, weight: .light, design: .default))
                        .foregroundColor(Color.white)
                    //                    .padding(20)
                        .multilineTextAlignment(.center)
                        .offset( x: subjectIndent, y: -60 )
                        .opacity(self.shouldHide ? 0 : 1)
                    
                    if(questionNumber > 0){
                        Text("?")
                            .font(.system(size: 24, weight: .medium, design: .default))
                            .foregroundColor(Color.white)
                        //                    .padding(20)
                            .multilineTextAlignment(.center)
                            .offset( x: -6, y: -60 )
                            .opacity(self.shouldHide ? 0 : 1)
                    }
                }
                
                HStack (spacing: 20)
                {
                    
                    
                    Button{
                        
                        if questionNumber > 6 {
                            self.shouldHide = true
                            
                        }
                        else{
                            questionNumber += 1
                            updateQuestion()
                        }
                        
                    } label:
                    {
                        Text("Yes")
                            .frame(width: 100, height:50)
                            .background(Color.red)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(Color.white)
                        
                            .cornerRadius(3.0)
                    }.offset(x:-20)
                        .opacity(self.shouldHide ? 0 : 1)
                    
                    Button{
                        if questionNumber > 2 {
                            self.shouldHide = true
                            
                        }
                        else{
                            questionNumber += 1
                            updateQuestion()
                        }
                        
                        updateQuestion()
                    } label:
                    {
                        Text("No")
                            .frame(width: 100, height:50)
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .cornerRadius(3.0)
                    }.offset(x:20)
                        .opacity(self.shouldHide ? 0 : 1)
                }.offset(y:-20)
                    .statusBar(hidden: true)
            }.statusBar(hidden: true)
                .opacity(self.shouldHide ? 1 : 0) /// HIDE
            
            
            ////            Spacer()
            
            
        }.statusBar(hidden: true)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
    }
    
    
    
    struct QuestionView_Previews: PreviewProvider {
        static var previews: some View {
            QuestionView()
        }
    }
    
    
}
