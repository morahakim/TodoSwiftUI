//
//  SettingsView.swift
//  TodoSwiftUI
//
//  Created by Irianda on 22/02/21.
//

import SwiftUI

struct SettingsView: View {
   
   @Environment(\.presentationMode) var presentationMode
   @EnvironmentObject var iconSettings: IconNames
   
   var body: some View {
      NavigationView{
         VStack(alignment: .center){
            Form{
               
               Section(header: Text("Choose the app icon")){
                  Picker(selection: $iconSettings.currentIndex, label: Text("App Icons")){
                     ForEach(0..<iconSettings.iconNames.count){index in
                        HStack{
                           Image(uiImage: UIImage(named: self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                              .renderingMode(.original)
                              .resizable()
                              .scaledToFit()
                              .frame(width: 44,height: 44)
                              .cornerRadius(8)
                           
                           Spacer().frame(width: 8)
                           
                           Text(self.iconSettings.iconNames[index] ?? "Blue")
                              .frame(alignment: .leading)
                        }
                        .padding(3)
                     }
                  }
                  .onReceive([self.iconSettings.currentIndex].publisher.first()){
                     (value) in
                     let index = self.iconSettings.iconNames.firstIndex(of:
                                                                           UIApplication.shared.alternateIconName) ?? 0
                     if index != value {
                        UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]){
                           error in
                           if let error = error {
                              print(error.localizedDescription)
                           }else{
                              print("Success")
                           }
                        }
                     }
                  }
               }
               .padding(.vertical,3)
               
               Section(header: Text("Follow me on my social media")){
                  FormRowLinkView(icon: "globe", color: Color.pink, text: "My Website", link: "mora-hakim.web.app")
                  FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "")
                  FormRowLinkView(icon: "desktop", color: Color.purple, text: "Instagram", link: "")
               }
               .padding(.vertical,3)
               
               Section(header: Text("About the application")){
                  FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                  FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone,iPad")
                  FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Hakim")
                  FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.1.0")
               }
               .padding(.vertical,3)
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular) //style horizontal yang tepi kanan dan kiri ny ga rapet ke kanan dan kiri. kalo style yg lain namanya .compact = fungsi ny kebalikan yg regular
            
            Text("Copyright All rights reserved. Less code")
               .multilineTextAlignment(.center)
               .font(.footnote)
               .padding(.top,6)
               .padding(.bottom,8)
               .foregroundColor(.secondary)
         }
         
         .navigationBarItems(trailing:
                              Button(action: {
                                 self.presentationMode.wrappedValue.dismiss()
                              }){
                                 Image(systemName: "xmark")
                              }
         )
         .navigationBarTitle("Settings",displayMode: .inline)
         .background(Color("ColorBase")).edgesIgnoringSafeArea(.all)
      }
   }
}

struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      SettingsView()
   }
}
