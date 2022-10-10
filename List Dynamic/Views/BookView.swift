//
//  ContentView.swift
//  List Dynamic
//
//  Created by GranzaX on 13/03/22.
//

import SwiftUI
import SwiftyJSON



struct BookView: View {
    @State var arrBooks = [Book]()
    
    var body: some View {
        NavigationView {
            List(arrBooks) { book in
                
                VStack(alignment: .leading) {
                    
                    Text("\(book.first_name)")
                        .font(.title)
                        .foregroundColor(.red)
                        .padding(.bottom)
                    
                    HStack () {
                        Text("\(book.last_name)")
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading)
                            .font(.body)
//                            .fontWeight(.bold)
                            .background(Color.red)
                        
                        Text("\(book.email)")
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: 100,
                                alignment: .trailing)
                            .font(.body)
//                            .fontWeight(.semibold)
                            .background(Color.green)
                            .lineLimit(3)
                    }
                    Spacer()
                }
                
                
                
            }
            .navigationTitle("Book List")
        }
        .onAppear() {
            BookUsersPresenter().loadData { (books) in
                self.arrBooks = books
            }
        }
    }
    
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}


