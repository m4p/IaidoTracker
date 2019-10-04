//
//  ContentView.swift
//  test WatchKit Extension
//
//  Created by Martin Pittenauer on 10/4/19.
//  Copyright © 2019 Martin Pittenauer. All rights reserved.
//

import SwiftUI

let groups = ["Tōhō","Seiza","Battō Hō","Battō Hō Okuiai"]
let wazas = [["Maegiri","Zengōgiri","Kiriage","Shihōgiri","Kissakigaeshi"],
             ["Mae","Migi","Hidari","Ushiro","Yaegaki","Ukenagashi","Kaishaku","Tsukekomi","Tsukikage","Oikaze","Nukiuchi"],
             ["Juntō sono Ichi","Juntō sono Ni","Tsuigekito","Shatō","Shihōtō sono Ichi","Shihōtō sono Ni","Zantotsutō"],
             ["Zenteki Gyakutō","Tatekitō","Kōteki Gyakutō","Kōteki Nukiuchi"]]

//TODO add cloukit support.

struct ContentView: View {
    var body: some View {
        List {
                ForEach(0...3, id: \.self) { groupIndex in
                    Group{
                        Text(groups[groupIndex]).listRowBackground(Color.clear)
                        ForEach(wazas[groupIndex], id: \.self) { wazaName in
                            HStack {
                                Text(wazaName)
                                Text("0").frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                    }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
