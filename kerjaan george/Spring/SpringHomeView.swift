//
//  SpringHomeView.swift
//  Chromatch
//
//  Created by George Timothy Mars on 15/06/25.
//

import SwiftUI

struct SpringHomeView: View {
    @State var selectedaTab : AppTab
    var body: some View {
        NavigationStack{
            ZStack{
                Image("SpringBG")
                    .aspectRatio(contentMode: .fit)
       
                VStack{
                    //Page Title
                    HStack{
                        ZStack{
                            Rectangle()
                                .fill(Color.white)
                                .opacity(0.3)
                                .cornerRadius(20)
                                .frame(width: 90, height: 32)
                                
                            Text("Home")
                                .fixedSize()
                                .font(.system(size: 16, weight: .medium, design: .default))
                        }
                        
                    }.frame(width: 393, height: 63)
                    
                    HStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 64, height: 64)
                        
                        Spacer()
                        Image("SpringLogo")
                            .resizable()
                            .frame(width: 48, height: 48)
                        
                    }
                    .frame(width: 361, height: 64)
                    .padding(.top, 4)
                    .padding(.horizontal, 16)
                    
                    HStack{
                        Text("Spring")
                            .font(.system(size: 48))
                            .fontWeight(.medium)
                        Spacer()
                    }.frame(width: 361, height: 58)
                        .padding(.top, 4)
                    
                    HStack{
                        Text("Fresh, warm, and lively")
                        Spacer()
                    }.frame(width: 361, height: 22)
                        .padding(.top, 4)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color(red: 0.18, green: 0.32, blue: 0).opacity(0.5))
                            .frame(width: 377, height: 39)
                            .cornerRadius(16)

                        HStack {
                            Text("You glow in warm, vibrant shades.")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                            Spacer()
                        }
                        .frame(width: 377, height: 39)
                    }
                    .padding(.top, 10)
                    
                    //Kotak Your Palette
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .opacity(0.5)
                            .frame(width: 377, height: 238)
                            .cornerRadius(18)
                        
                        VStack {
                            
                            HStack{
                                Text("Your Palette")
                                    .font(.system(size: 20, weight: .medium))
                                
                                Spacer()
                                
                                NavigationLink(destination: SpringPaletteView()){
                                    ZStack{
                                        //Jangan Lupa bikin button disini
                                        Circle()
                                            .fill(Color.black)
                                            .opacity(0.1)
                                            .frame(width: 36, height: 36)
                                        Image("HomeMaxBtn")
                                    }
                                    .frame(width: 36, height: 36)
                                }
                                
                            }
                            .frame(width: 345, height: 36)
                            
                            HStack{
                                //Kotak2 Warna
                                ZStack{
                                    Rectangle()
                                        .fill(Color(red: 0.48, green: 0.48, blue: 0.51))
                                        .cornerRadius(8)
                                    VStack{
                                        HStack{
                                            Text("Color Name")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                                .padding(.leading, 8)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("123456")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                                .padding(.leading, 8)
                                            Spacer()
                                        }
                                        
                                    }
                                }
                                .frame(width: 167.5 , height: 72)
                                
                                ZStack{
                                    Rectangle()
                                        .fill(Color(red: 0.48, green: 0.48, blue: 0.51))
                                        .cornerRadius(8)
                                    VStack{
                                        HStack{
                                            Text("Color Name")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                                .padding(.leading, 8)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("123456")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                                .padding(.leading, 8)
                                            Spacer()
                                        }
                                        
                                    }
                                }
                                .frame(width: 167.5 , height: 72)
                            }
                            .frame(width: 345, height: 72)
                            
                            HStack{
                                //Kotak2 Warna
                                ZStack{
                                    Rectangle()
                                        .fill(Color(red: 0.48, green: 0.48, blue: 0.51))
                                        .cornerRadius(8)
                                    VStack{
                                        HStack{
                                            Text("Color Name")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                                .padding(.leading, 8)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("123456")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                                .padding(.leading, 8)
                                            Spacer()
                                        }
                                        
                                    }
                                }
                                .frame(width: 167.5 , height: 72)
                                
                                ZStack{
                                    Rectangle()
                                        .fill(Color(red: 0.48, green: 0.48, blue: 0.51))
                                        .cornerRadius(8)
                                    VStack{
                                        HStack{
                                            Text("Color Name")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                                .padding(.leading, 8)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("123456")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16))
                                                .padding(.leading, 8)
                                            Spacer()
                                        }
                                        
                                    }
                                }
                                .frame(width: 167.5 , height: 72)
                            }
                            .frame(width: 345, height: 72)
                        }
                       
                        
                    }
                    .frame(width: 377, height: 238)
                    
                    //Kotak Seasonal Twins
                    ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .opacity(0.5)
                            .cornerRadius(16)
                            .frame(width: 377, height: 176)
                        
                        VStack{
                            HStack {
                                Text("Seasonal Twins")
                                    .font(.system(size: 20, weight: .medium))
                                    .padding(.leading, 16)
                                    .padding(.bottom, 8)
                                Spacer()
                            }.frame(width: 377, height: 24)
                            
                            HStack{
                                //Twins
                                VStack{
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    Text("Sabrina Carpenter")
                                        .font(.system(size: 12))
                                        .padding(.top, 8)
                                }
                                .padding()
                                
                                VStack{
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    Text("Amanda Seyfried")
                                        .font(.system(size: 12))
                                        .padding(.top, 8)
                                }
                                .padding()
                                
                                VStack{
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    Text("Kate Hudson")
                                        .font(.system(size: 12))
                                        .padding(.top, 8)
                                }
                                .padding()
                                
                            }
                            
                            .frame(width: 345, height: 104)
                        }
                                
                    }
                    .frame(width: 377, height: 176)
                    
                    //panggil navbar disini
                    MainTabView(selectedTab: $selectedaTab)
                        
                    
                    
                }// akhir dari VSstack
                
            
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SpringHomeView(selectedaTab: .home)
}
