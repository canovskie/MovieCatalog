import UIKit

class VenueViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var getDataButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var venues: [Venue] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func getDataTapped(_ sender: Any) {
        getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "venueCell", for: indexPath) as! VenueTableViewCell
        cell.configure(venue: venues[indexPath.row])
        return cell
    }
    
    private func getData() {
        let urlString = "https://coinmap.org/api/v1/venues/"
        NetworkingManager.shared.fetchData(from: urlString) { (result: Result<VenuesResponse, NetworkError>) in
            switch result {
            case .success(let response):
                self.venues = response.venues
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
//                TODO: UIAlertController ile hatayı ekrana bas
            }
        }
    }
}
