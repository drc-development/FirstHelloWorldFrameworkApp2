//
//  ContentView.swift
//  FirstHelloWorldFrameworkApp1
//
//  Created by Daryl Cox on 04/07/2025.
//  Copyright © JustMacApps 2023-2025. All rights reserved.
//

import Foundation
import SwiftUI
import FirstHelloWorldFramework1

struct ContentView: View
{

    @State private var sCurrentGreeting:String                             = "Loading..."
    @State private var listOfNames:[String]                                = ["Alice", "Bob", "Charlie", "Diana"]
    @State private var listOfParallelResults:[String]                      = []

                   let firstHelloWorldFramework1:FirstHelloWorldFramework1 = FirstHelloWorldFramework1()
    
    var body: some View
    {

        VStack(spacing: 20)
        {

            Text("Swift 5 Hello Framework Demo")
                .font(.title)
                .fontWeight(.bold)
            
            Text(sCurrentGreeting)
                .font(.title2)
                .padding()
                .background(Color.yellow.opacity(0.3))
                .cornerRadius(10)
            
            HStack
            {

                Button("Basic Hello")
                {

                    sCurrentGreeting = firstHelloWorldFramework1.sayHello()

                }
                .buttonStyle(.bordered)
                
                Button("Hello John")
                {

                    sCurrentGreeting = firstHelloWorldFramework1.sayHelloTo(to:"John")

                }
                .buttonStyle(.bordered)
                
                Button("Fancy Hello")
                {
              
                    Task
                    {
              
                        sCurrentGreeting = await firstHelloWorldFramework1.sayHelloFancily()
              
                    }
              
                }
                .buttonStyle(.bordered)

            }
            
            Divider()
            
        //  Text("Parallel Greetings Demo")
        //      .font(.headline)
        //
        //  Button("Run Parallel Greetings")
        //  {
        //
        //      Task
        //      {
        //
        //          listOfParallelResults = await firstHelloWorldFramework1.processGreetingsInParallel(names:listOfNames)
        //          sCurrentGreeting = "Processed \(listOfParallelResults.count) greetings in parallel..."
        //
        //      }
        //
        //  }
        //  .buttonStyle(.borderedProminent)
        //
        //  ScrollView
        //  {
        //
        //      VStack(alignment: .leading)
        //      {
        //
        //          ForEach(listOfParallelResults, id: \.self)
        //          { result in
        //
        //              Text(result)
        //                  .padding(8)
        //
        //          }
        //
        //      }
        //      .frame(maxWidth: .infinity, alignment: .leading)
        //
        //  }
        //  .frame(height: 200)
        //  .background(Color.gray.opacity(0.1))
        //  .cornerRadius(10)

        }
        .padding()
        .onAppear
        {
            sCurrentGreeting = firstHelloWorldFramework1.sayHello()
        }

    }   // End of var body: some View.

}   // End of struct ContentView: View.

#Preview
{
    
    ContentView()
    
}
