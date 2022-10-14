//
//  ContentView.swift
//  BackgroundAnimation
//
//  Created by Tommy Ludwig on 14.10.22.
//

import SwiftUI

struct ContentView: View {
    @State private var startAniamtion: Bool = false
    var body: some View {
        ZStack {
            Background()
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Material.thin)
                    .frame(width: 300, height: 150)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
                    .overlay {
                        VStack {
                            HStack {
                                Image(systemName: "person.circle")
                                
                                Text("Title")
                                    .redacted(reason: .placeholder)
                                Spacer()
                            }
                            .foregroundColor(.blue)
                            .font(.title)
                            
                            Text("Title aldjfljdd fölasjdfölk asdölkasdjflj sdfölaksdjf asöldkfj asdlökfj asöldkfj aösldkfj asdölkfj")
                                .redacted(reason: .placeholder)
                            
                            Spacer()
                        }.padding()
                    }
                    .padding()
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Material.thin)
                    .frame(width: 300, height: 150)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
                    .overlay {
                        VStack {
                            HStack {
                                Image(systemName: "person.circle")
                                
                                Text("Title")
                                    .redacted(reason: .placeholder)
                                Spacer()
                            }
                            .foregroundColor(.blue)
                            .font(.title)
                            
                            Text("Title aldjfljdd fölasjdfölk asdölkasdjflj sdfölaksdjf asöldkfj asdlökfj asöldkfj aösldkfj asdölkfj")
                                .redacted(reason: .placeholder)
                            
                            Spacer()
                        }.padding()
                    }
                    .padding()
                    
            }
        }
        .onAppear {
            self.startAniamtion.toggle()
        }

        
    }
    
    @ViewBuilder func Background() -> some View {
        TimelineView(.animation(minimumInterval: 6.6, paused: false)) { _ in
            
            Canvas { context, size in
                context.addFilter(.blur(radius: 10))
                context.drawLayer { gc in
                    for index in 0...4 {
                        if let resolvedView = context.resolveSymbol(id: index) {
                            gc.draw(resolvedView, at: CGPoint(x: size.width / 2, y: size.height / 2))
                        }
                    }
                }
            } symbols: {
                
                BackgroundCircle(offset: startAniamtion ? CGSize(width: .random(in: -180...180), height: .random(in: -240...240)) : .zero, color: .blue, frame: 75)
                    .tag(1)
                    

                BackgroundCircle(offset: startAniamtion ? CGSize(width: .random(in: -180...180), height: .random(in: -240...240)) : .zero, color: .orange, frame: 130)
                    .tag(2)

                BackgroundCircle(offset: startAniamtion ? CGSize(width: .random(in: -180...180), height: .random(in: -240...240)) : .zero, color: .pink, frame: 200)
                    .tag(3)
                    
                BackgroundCircle(offset: startAniamtion ? CGSize(width: .random(in: -180...180), height: .random(in: -240...240)) : .zero, color: .green, frame: 200)
                    .tag(4)

            }
        }
    }
    
    @ViewBuilder func BackgroundCircle(offset: CGSize = .zero, color: Color, frame: CGFloat) -> some View {
        Circle()
            .fill(color)
            .shadow(color: .black.opacity(1), radius: 10, x: 10, y: 10)
            .frame(width: frame, height: frame)
            .offset(offset)
            .animation(.easeInOut(duration: 7), value: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
