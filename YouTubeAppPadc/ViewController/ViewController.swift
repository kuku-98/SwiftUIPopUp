//
//  ViewController.swift
//  YouTubeAppPadc
//
//  Created by Theint Su on 14/3/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableviewVideos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      setUpTableView()
        
    }
    
    private func setUpTableView(){
        tableviewVideos.delegate = self
        tableviewVideos.dataSource = self
        tableviewVideos.register(UINib(nibName: String(describing: VideoTableViewCell.self) , bundle: nil), forCellReuseIdentifier: String(describing: VideoTableViewCell.self))
        
    }


}



extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoTableViewCell.self), for: indexPath) as? VideoTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let ViedoDetailsViewController = storyboard.instantiateViewController(withIdentifier: String(describing: VideoDetailsViewController.self))
        
//                navigationController?.pushViewController(ViedoDetailsViewController, animated: true)
            
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: VideoDetailsViewController.self)) as? VideoDetailsViewController else{return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}

