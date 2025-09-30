//
//  DynamicList.swift
//  Feed-revise-30-09-25-sk2
//
//  Created by Filip Vabroušek on 30.09.2025.
//

import SwiftUI

struct DynamicList: View {
    
    var names = ["Eda", "Karel", "Jana", "Hana"]
    
    var body: some View {
       /* List(names, id:\.self) {
           Text($0)
        }
        
        List(names, id:\.self) { name in
           Text(name)
        }
        
        List {
            ForEach(names, id:\.self){
                Text($0)
            }
        }*/
        
        List(0...2025, id:\.self){ i in
            if (i == 2020)
             {
                Text("\(i) COVID").foregroundStyle(.orange)
                
            } else if i % 2 == 0 {
                Text("\(i)")
                    .foregroundStyle(.green)
                    .bold()
               
            } else {
                Text("\(i)")
            }
            
        }
    }
}

#Preview {
    DynamicList()
}
