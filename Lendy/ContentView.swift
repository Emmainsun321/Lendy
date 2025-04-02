
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView().tabItem {
                Label("Home", systemImage: "house.fill")
            }.tag(0)

            BrowseView().tabItem {
                Label("Browse", systemImage: "square.grid.2x2.fill")
            }.tag(1)

            ListItemView().tabItem {
                Label("List", systemImage: "plus.app.fill")
            }.tag(2)

            MessagesView().tabItem {
                Label("Messages", systemImage: "bubble.left.and.bubble.right.fill")
            }.tag(3)

            ProfileView().tabItem {
                Label("Profile", systemImage: "person.fill")
            }.tag(4)
        }
        .accentColor(Color.green)
    }
}

struct HomeView: View {
    let items = [
        ("Pink Satin Slip Dress", "$22/day"),
        ("Floral Midi Dress", "$20/day"),
        ("Cream Blazer", "$18/day"),
        ("Black Off-Shoulder Dress", "$24/day")
    ]

    var body: some View {
        NavigationView {
            List(items, id: \.0) { item in
                VStack(alignment: .leading) {
                    Text(item.0)
                        .font(.headline)
                        .foregroundColor(.green)
                    Text(item.1)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .navigationTitle("Trending")
        }
    }
}

struct BrowseView: View {
    let categories = ["Event Looks", "Grad Dresses", "Vacation Rentals", "Designer Bags"]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Browse Categories")
                .font(.title2)
                .foregroundColor(.green)
                .padding(.horizontal)
            ForEach(categories, id: \.self) { cat in
                Text(cat)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.pink.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(.green)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .padding(.top)
    }
}

struct ListItemView: View {
    @State private var itemName = ""
    @State private var price = ""
    @State private var imageUrl = ""

    var body: some View {
        Form {
            TextField("Item name", text: $itemName)
            TextField("Price per day", text: $price)
            TextField("Image URL", text: $imageUrl)
            Button("List Item") {
                // handle item listing
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(10)
        }
    }
}

struct MessagesView: View {
    var body: some View {
        Text("Your messages will appear here.")
            .foregroundColor(.gray)
            .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Your profile and past rentals.")
            .foregroundColor(.gray)
            .padding()
    }
}
