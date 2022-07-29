//
//  ViewController.swift
//  Exercise01
//
//  Created by Andrew Ok on 2022-07-27.
//

import UIKit

class ViewController: UIViewController {
    
    // define structures for Objects' parameters
    struct Posters {
        let title: String
        let year: String
        let imageName: String
    }
    
    struct DetailData {
        let title: String
        let year: String
        let imageName: String
        let runningTime: String
        let director: String
    }
    
    //create movie data with arguments
    let data: [Posters] = [
        Posters(title: "Black Widow", year: "2021", imageName: "black-widow"),
        Posters(title: "Avengers: Endgame", year: "2019", imageName: "avengers-endgame"),
        Posters(title: "Thor: Love and Thunder", year: "2022", imageName: "thor-love-and-thunder"),
        Posters(title: "Jurassic Park", year: "1993", imageName: "jurassic-park")
    ]
    
    let detailData: [DetailData] = [
        DetailData(title: "Black Widow", year: "2021", imageName: "black-widow", runningTime: "2h 13m", director: "Cate Shortland"),
        DetailData(title: "Avengers: Endgame", year: "2019", imageName: "avengers-endgame", runningTime: "3h 2m", director: "Anthony Russo, Joe Russo"),
        DetailData(title: "Thor: Love and Thunder", year: "2022", imageName: "thor-love-and-thunder", runningTime: "1h 59m", director: "Taika Waititi"),
        DetailData(title: "Jurassic Park", year: "1993", imageName: "jurassic-park", runningTime: "2h 7m", director: "Steven Spielberg")
    ]
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}// end class

extension ViewController: UITableViewDelegate {
    // fix the height of image
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    // instantiate "DetailsViewController"
    // pass data to it and go to the detail screen
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            let detailData = detailData[indexPath.row]
            vc.img = UIImage(named: detailData.imageName)!
            vc.titleLabel = detailData.title
            vc.yearLabel = detailData.year
            vc.runningtime = detailData.runningTime
            vc.directorName = detailData.director
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}// end extension

extension ViewController: UITableViewDataSource {
    // add cells based on the number of data array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    // assign values to each items
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let posters = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.movie_title.text = posters.title
        cell.movie_year.text = posters.year
        cell.poster_img.image = UIImage(named: posters.imageName)!
        return cell
    }
}// end extension

