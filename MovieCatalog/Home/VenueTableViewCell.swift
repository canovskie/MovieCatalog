import UIKit

class VenueTableViewCell: UITableViewCell {
    @IBOutlet weak var venueNameLabel: UILabel!
    func configure(venue: Venue) {
        venueNameLabel.text = venue.name
    }
}
