//
//  SpringPaletteView.swift
//  Chromatch
//
//  Created by George Timothy Mars on 15/06/25.
//

import SwiftUI

struct SpringPaletteView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                ZStack{
                    Image("SpringBG")
                        .frame(height : 1451)
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea(edges: .all)
                    
                    ZStack{
                        Rectangle()
                            .fill(Color.white)
                            .opacity(0.5)
                            .frame(width: 377, height: 1383)
                            .cornerRadius(18)
                        
                        VStack{
                            HStack{
                                VStack{
                                    HStack{
                                        Text("Your Palette")
                                            .font(.system(size: 20))
                                            .fontWeight(.medium)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text("Colors that flatter your tone")
                                            .font(.system(size: 12))
                                            .fontWeight(.light)
                                        Spacer()
                                    }
                                    
                                }
                                Spacer()
                                
                                NavigationLink(destination: SpringHomeView(selectedaTab: .home)){
                                    ZStack{
                                        Circle()
                                            .opacity(0.1)
                                        Image("HomeMinBtn")
                                    }
                                }
                                
                                
                                
                            }
                            .frame(width: 345, height: 40)
                            .padding(.bottom, 16)
                            
                            //Neutrals
                            VStack{
                                HStack{
                                    Text("Neutrals")
                                    Spacer()
                                }
                                
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
                            .frame(width: 345, height: 183)
                            
                            //Metallics
                            VStack{
                                HStack{
                                    Text("Metallics")
                                    Spacer()
                                }
                                
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
                            .frame(width: 345, height: 111)
                            
                            //Brights
                            VStack{
                                HStack{
                                    Text("Brights")
                                    Spacer()
                                }
                                
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
                            .frame(width: 345, height: 183)
                            
                            //Pink&Reds
                            VStack{
                                HStack{
                                    Text("Pink & Reds")
                                    Spacer()
                                }
                                
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
                            .frame(width: 345, height: 183)
                            
                            //Y&O
                            VStack{
                                HStack{
                                    Text("Yellow & Oranges")
                                    Spacer()
                                }
                                
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
                            .frame(width: 345, height: 183)
                            
                            //Greens
                            VStack{
                                HStack{
                                    Text("Greens")
                                    Spacer()
                                }
                                
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
                            .frame(width: 345, height: 183)
                            
                            //Blue&Purples
                            VStack{
                                HStack{
                                    Text("Blue & Purples")
                                    Spacer()
                                }
                                
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
                            .frame(width: 345, height: 183)
                            
                        }// akhir dari vstack
                    }
                    .frame(width: 377, height: 1383)
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    SpringPaletteView()
}
