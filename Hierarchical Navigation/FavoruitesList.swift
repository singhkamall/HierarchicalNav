import Foundation
import UIKit

class FavouritesList{
    static let sharedFavouritesList = FavouritesList()
    
    private(set) var favourites:[String]
    
    // constructor
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
    }
    
    func addFavourites(fontName: String) {
        if !favourites.contains(fontName) {
        favourites.append(fontName)
            saveFavourites()
        }
    }
    
    // saves font favourites to the user preferences file
    private func saveFavourites() {
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
    }
    
    // removes favourites from the user preferences file
    func removeFavourites(fontName: String) {
        if let index = favourites.index(of: fontName)
        {
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
}
