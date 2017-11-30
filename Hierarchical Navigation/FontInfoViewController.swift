
import UIKit

class FontInfoViewController: UIViewController {

    var font: UIFont!
    var favourite: Bool = false
    
    @IBOutlet weak var fontSampleLabel: UILabel!
    @IBOutlet weak var fontSizeSlider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var favouriteSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz 0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSampleLabel.text = "\(Int(font.pointSize))"
        favouriteSwitch.isOn = favourite
    }
    
    @IBAction func slideFontSize(slider: UISlider) {
        let newSize = roundf(slider.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
    }

    @IBAction func toggleFavourite(sender: UISwitch){
        let favouritesList = FavouritesList.sharedFavouritesList
        if sender.isOn {
            favouritesList.addFavourites(fontName: font.fontName)
        }else{
            favouritesList.removeFavourites(fontName: font.fontName)
        }
    }
    
    
    
}
