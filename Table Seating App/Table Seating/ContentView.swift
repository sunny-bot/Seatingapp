//
//  ContentView.swift
//  Table Seating
//
//  Created by Sunny Zhao on 2/17/20.
//  Copyright © 2020 Sunny Zhao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetcher = Fetcher()

    @State var assignments = "Your seating:"
    @State var tableMates = "Your Mates:"
    @State var input = ""
    
    
    var body: some View {
        ZStack{
            
            Color(.systemPurple)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Cate Formal Dinner")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                
                Spacer()
                
                Text(assignments).font(.body)
                    .fontWeight(.semibold)
                    .frame(width: 200.0).padding()
                
                Spacer()
                
                Text(tableMates).font(.body)
                    .fontWeight(.semibold)
                    .frame(width: 200.0).padding()
                
                Spacer()
                TextField("Enter name", text: $input, onEditingChanged: {_ in
                })
                    .padding()
                
                
                Spacer()
                Button(action: {
                    self.fetcher.delegate = self
                    self.fetcher.performRequest(name: self.input)
                }) {
                    Text("Search")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
            }
            .background(
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
        }
        
    }
}

extension ContentView: FetcherDelegate {
    func updateNames(_ fetcher: Fetcher, info: [[String]], name: String) {
        
        //String to list the name of table mates
        var outputString = ""
        //record the table the name is at
        var tableCounter = 0
        //for loop to search for the name within the 2d array
        outerLoop: for list in info {
            for testName in list {
                if testName == name {
                    //add names to the the diplay
                    for i in list {
                        outputString += i
                        outputString += " "
                    }
                    //add the assignment to the display
                    self.tableMates = outputString
                    if tableCounter == 0 {
                        self.tableMates = "Kitchen Staff"
                    }
                    else if tableCounter == 1 {
                        self.tableMates = "Waiter"
                    }
                    else {
                        self.tableMates = String(tableCounter - 1)
                    }
                    break outerLoop
                }
            }
            tableCounter += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

