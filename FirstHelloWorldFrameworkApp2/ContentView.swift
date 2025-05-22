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

    struct ClassInfo
    {
        
        static let sClsId        = "AppAboutView"
        static let sClsVers      = "v1.0204"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright © JustMacApps.net 2024-2025. All rights reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // App Data field(s):

//  @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

#if os(macOS)
    private let pasteboard                                                 = NSPasteboard.general
#elseif os(iOS)
    private let pasteboard                                                 = UIPasteboard.general
#endif

    @AppStorage("firstHelloWorldFrameworkApp2CurrentGreeting")
           private var sCurrentGreeting:String                             = "Loading..."
    @State private var listOfNames:[String]                                = ["Alice", "Bob", "Charlie", "Diana"]
    @State private var listOfParallelResults:[String]                      = []

                   let firstHelloWorldFramework1:FirstHelloWorldFramework1 = FirstHelloWorldFramework1()

//          var appGlobalInfo:AppGlobalInfo               = AppGlobalInfo.ClassSingleton.appGlobalInfo
//          var jmAppDelegateVisitor:JmAppDelegateVisitor = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    init()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Exit...

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of init().

//  private func xcgLogMsg(_ sMessage:String)
//  {
//
//      if (self.jmAppDelegateVisitor.bAppDelegateVisitorLogFilespecIsUsable == true)
//      {
//      
//          self.jmAppDelegateVisitor.xcgLogMsg(sMessage)
//      
//      }
//      else
//      {
//      
//          print("\(sMessage)")
//      
//      }
//
//      // Exit:
//
//      return
//
//  }   // End of private func xcgLogMsg().

    private func xcgLogMsg(_ sMessage:String)
    {

        let dtFormatterDateStamp:DateFormatter = DateFormatter()

        dtFormatterDateStamp.locale     = Locale(identifier: "en_US")
        dtFormatterDateStamp.timeZone   = TimeZone.current
        dtFormatterDateStamp.dateFormat = "yyyy-MM-dd hh:mm:ss.SSS"

        let dateStampNow:Date = .now
        let sDateStamp:String = ("\(dtFormatterDateStamp.string(from:dateStampNow)) >> ")

        print("\(sDateStamp)\(sMessage)")

        // Exit:

        return

    }   // End of private func xcgLogMsg().

    var body: some View
    {

        let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp):body' \(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)...")

        ScrollView
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
                Text("\(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)")     // <=== Version...
                    .italic()
                Text("")
                Text("- - - - - - - - - - - - - - -")
                Text("UserDefaults file:")
                    .font(.caption2)
                Text("\(JmXcodeBuildSettings.jmAppUserDefaultsFileLocation)")
                    .lineLimit(8)
                    .font(.caption2)
                    .contextMenu
                    {
                        Button
                        {
                            let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp):ContentView in Text.contextMenu.'copy' button #1...")

                            copyUserDefaultsFilespecToClipboard()
                        }
                        label:
                        {
                            Text("Copy to Clipboard")
                        }
                    }
                Text("- - - - - - - - - - - - - - -")
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

        }

    }   // End of var body: some View.

    private func copyUserDefaultsFilespecToClipboard()
    {
        
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
          
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - for text of [\(JmXcodeBuildSettings.jmAppUserDefaultsFileLocation)]...")
        
    #if os(macOS)
        pasteboard.prepareForNewContents()
        pasteboard.setString(JmXcodeBuildSettings.jmAppUserDefaultsFileLocation, forType:.string)
    #elseif os(iOS)
        pasteboard.string = JmXcodeBuildSettings.jmAppUserDefaultsFileLocation
    #endif

        // Exit...
    
        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")
    
        return
        
    }   // End of private func copyUserDefaultsFilespecToClipboard().
    
}   // End of struct ContentView: View.

#Preview
{
    
    ContentView()
    
}
