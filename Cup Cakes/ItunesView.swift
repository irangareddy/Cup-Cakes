//
//  ItunesView.swift
//  Cup Cakes
//
//  Created by RANGA REDDY NUKALA on 20/09/20.
//

import SwiftUI

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct Response: Codable {
    var results: [Result]
}

struct ItunesView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
                    VStack(alignment: .leading) {
                        Text(item.trackName)
                            .font(.headline)
                        Text(item.collectionName)
                        
                    }
        }.onAppear(perform: {
            loadData()
        })
    }
    
    func loadData() {
//        Creating the URL we want to read.
        guard let url = URL(string: "https://itunes.apple.com/search?term=telugu&entity=song") else {
            print("Invalid URL")
            return
        }
//        Wrapping that in a URLRequest, which allows us to configure how the URL should be accessed.
        let request = URLRequest(url: url)
        
//        Create and start a networking task from that URL request.
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            //        Handle the result of that networking task.
            
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                            DispatchQueue.main.async {
                                // update our UI
                                self.results = decodedResponse.results
                            }

                            // everything is good, so we can exit
                            return
                }
                
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
            
        }.resume()
        

        
    }
    
}


struct ItunesView_Previews: PreviewProvider {
    static var previews: some View {
        ItunesView()
    }
}
