//
//  EmptyListView.swift
//  TodoSwiftUI
//
//  Created by Irianda on 18/02/21.
//

import SwiftUI

struct EmptyListView: View {
   @State private var isAnimated : Bool = false
   
   let images : [String] = [
      "illustration-no1",
      "illustration-no2",
      "illustration-no3"
   ]
   
   let tips : [String] = [
      "Gunakan waktu mu dengan bijak",
      "Keep down to earth",
      "Utamakan pekerjaan berat terlebih dahulu",
      "Apresiasi diri mu setelah bekerja",
      "Persiapkan hari esok lebih baik",
      "Asal perlahan yang penting selesai"
   ]
   
    var body: some View {
      ZStack{
         VStack(alignment: .center , spacing: 20){
            Image("\(images.randomElement() ?? self.images[0])")
               .resizable()
               .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
            Text("\(tips.randomElement() ?? self.tips[0])").font(.system(.headline, design: .rounded))
         }
         .padding(.horizontal)
         .opacity(isAnimated ? 1 : 0) //bentuk if else yang lbih singkat
         .offset(y: isAnimated ? 0 : -50)
         .animation(.easeOut(duration: 1.5)) //animasi yg di awal ny muncul ny cepat di akhirnya lambat
         //.easeIn
         .onAppear(perform: {
            self.isAnimated.toggle()
         })
      }
      .frame(minWidth: 0, maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
      .background(Color("ColorBase"))
      .edgesIgnoringSafeArea(.all)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
      EmptyListView().environment(\.colorScheme, .dark)
    }
}
