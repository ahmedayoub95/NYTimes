//
//  HomeVC.swift
//  NYTimes
//
//  Created by Ahmed-Ayub on 03/02/2023.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController {

    @IBOutlet weak var articlesTableView: UITableView!
    
    
    var articlesData:Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        articlesTableView.register(UINib(nibName: "NyTimesCell", bundle: nil), forCellReuseIdentifier: "nyTimesCell")
        self.setup()
        self.apiCall()
       
    }
    //list.dash
    func setup(){
        
        //Right bar items
        let editImage    = UIImage(systemName: "ellipsis.circle")!
        let searchImage  = UIImage(systemName: "magnifyingglass")!
        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(self.didTapEditButton))
        let searchButton = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: #selector(self.didTapSearchButton))
        editButton.tintColor = .white
        searchButton.tintColor = .white
        navigationItem.rightBarButtonItems = [editButton, searchButton]
        
        
        //Left bar items
        let button    = UIImage(systemName: "list.dash")!
        let sideButton   = UIBarButtonItem(image: button,  style: .plain, target: self, action: #selector(self.sideMenuBtn))
        sideButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = sideButton
    }
    
    //MARK: - Selectors
    @objc func didTapEditButton(sender: AnyObject){

    }

    @objc func didTapSearchButton(sender: AnyObject){

    }
    
    
    @objc func sideMenuBtn() {
        print("Pressed..!!")
       
        
    }
    
    
    
    //MARK: - API CALL
    
    func apiCall(){
        
        ArticlesViewModel.manager.articleApiCall() { [self] resp in
            
            switch resp {
            case let .success(resp):
                articlesData = resp
                articlesTableView.delegate = self
                articlesTableView.dataSource = self
                DispatchQueue.main.async { [self] in
                    articlesTableView.reloadData()
                }
                print(resp)
               
            case let .failure(error):
                print(error)
                break
                
            }
            
        }
    }
}



//MARK: - EXTENSION
extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nyTimesCell", for: indexPath) as! NyTimesCell
        
        let data = articlesData?.results?[indexPath.row]
      //  let media = data?.media?[indexPath.row]
        
        
        if indexPath.row < data?.media!.count ?? 0 {
            cell.articleImage?.sd_setImage( with: URL(string: data?.media?[indexPath.row].media_metadata?[1].url ?? ""), placeholderImage: UIImage(named: "placeholder"))
        }

        cell.titleLbl.text = data?.title
        cell.descriptionLbl.text = data?.abstract
        cell.authorLbl.text = data?.byline
        cell.dateLbl.text = data?.publishedDate
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let data = articlesData?.results?[indexPath.row]
        
       // DetailsSBID
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsSBID") as! DetailsVC
        let bold = data?.title ?? ""
      
        vc.titles = data!.title ?? ""
        vc.details = "\n\(data?.abstract ?? "")" + "\n\n\(data?.source ?? "")"
        vc.date = data?.publishedDate ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
    
}
