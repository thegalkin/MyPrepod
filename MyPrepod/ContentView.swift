//
//  ContentView.swift
//  MyPrepod
//
//  Created by Никита Галкин on 27.12.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		Button(Text("Perform Request"){
			print(RequestPerformer.requestForPerson())
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
