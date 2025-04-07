//
//  ContentView.swift
//  FirstHelloWorldFrameworkApp2
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
            
            Spacer()

            Text("Swift 5 Hello Framework Demo")
                .font(.title)
                .fontWeight(.bold)
            
            Text("")
            
            HStack
            {
                
                Text(">>> ")
                
                Text(sCurrentGreeting)

                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(10)
                
                Text(" <<<")
                
            }
            .font(.title)
            .padding()
             
            Text("")
            
            HStack
            {

                Button("SAY: 'Basic Hello'")
                {

                    sCurrentGreeting = firstHelloWorldFramework1.sayHello()

                }
                .buttonStyle(.bordered)
                
                Button("SAY: 'Hello John'")
                {

                    sCurrentGreeting = firstHelloWorldFramework1.sayHelloTo(to:"John")

                }
                .buttonStyle(.bordered)
                
                Button("SAY: A 'fancy' Hello")
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

        //  Spacer()

            Text("\(JmXcodeBuildSettings.jmAppDisplayName)")
                .bold()
            Text("")
            Text("Application Category:")
                .bold()
                .italic()
            Text("\(JmXcodeBuildSettings.jmAppCategory)")
            Text("")
        //  Spacer(minLength:2)
            Text("\(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)")     // <=== Version...
                .italic()
            Text("")
        //  Spacer(minLength:4)
            Text("\(JmXcodeBuildSettings.jmAppCopyright)")
                .italic()

        //  Spacer()
            
            Divider()

            Spacer()

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
