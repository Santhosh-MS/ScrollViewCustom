//
//  ViewController.swift
//  ScrollView
//
//  Created by Priya on 3/9/20.
//  Copyright © 2020 ZSL. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var arrBanner : [String] =  ["first","second","third","fourth","five","six"]
    
    lazy var contentViewSize : CGSize = {
        let size = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height + 400)
        return size
    }()
    
    lazy var horizontalMainContent : CGSize = {
        let size = CGSize(width: (self.view.frame.size.width * CGFloat(self.arrBanner.count)) - 250 , height: 200)
        return size
    }()
    
    lazy var horizontalMainScroll : UIScrollView = {
        let scroll = UIScrollView(frame : .zero)
        scroll.frame = CGRect(x: 0, y: 0, width:self.view.frame.size.width, height:200)
        scroll.backgroundColor = .orange
        scroll.contentSize = self.horizontalMainContent
        scroll.autoresizingMask =  .flexibleWidth  //.flexibleHeight
        scroll.bounces = true
        scroll.isPagingEnabled = true
        return scroll
    }()
    
    lazy var ADContentView : UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.frame.size = self.horizontalMainContent
        return view
    }()
    

    
    lazy var scrollView : UIScrollView = {
        let scroll = UIScrollView(frame : .zero)
        scroll.frame = CGRect(x: 0, y: 200, width:self.view.frame.size.width, height: self.view.frame.size.height - 200)
        scroll.backgroundColor = .white
        scroll.contentSize = self.contentViewSize
        scroll.autoresizingMask = .flexibleHeight //.flexibleWidth
        scroll.bounces = true
        
        return scroll
    }()
    
    lazy var viewContainer : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        view.frame.size = self.contentViewSize
        return view
    }()
    
    lazy var lblCenter : UILabel = {
        let label = UILabel()
        label.text = "Center set label for scrollview"
        label.frame.size = CGSize(width: 40, height: 20)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("-->Width : \(self.view.frame.size.width)")
        print("baner Width : \(self.view.frame.size.width * CGFloat(arrBanner.count))")
        viewInitMethod()
        scrollBannerView()
        
    }
    //MARK:- viewDesign
    func viewInitMethod() -> Void {
        self.view.addSubview(self.horizontalMainScroll)
        self.horizontalMainScroll.addSubview(self.ADContentView)
        //self.ADContentView.addSubview(Banner)
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.viewContainer)
        self.viewContainer.addSubview(lblCenter)

//        lblCenter.snp.makeConstraints { (mark) -> Void in
//            //mark.center.equalToSuperview()
//            mark.center.equalTo(self.viewContainer)
//        }
        print("count -> : \(self.view.subviews.count)")
        for view in self.view.subviews {
            print(view)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollBannerView() -> Void{
     
        for i in 0..<arrBanner.count {
            print(i)
            if i == 0 {
                self.ADContentView.addSubview(addBanners(position : CGFloat(5),index: i))
            }else {
                 let widths : CGFloat = (self.view.frame.size.width - 50) * CGFloat(i)
                self.ADContentView.addSubview(addBanners(position : widths,index: i))
            }
        }

    }

    func addBanners(position : CGFloat,index : Int) ->UIView {
        print("1\n")
            let Banner : UIView = {
                let view = UIView()
                let widths : CGFloat = self.view.frame.size.width - 70
                view.frame.size = CGSize( width: widths, height: 160)
                view.frame.origin.x = CGFloat(position)
                view.frame.origin.y = 30
                view.backgroundColor  = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                view.clipsToBounds = true
                view.layer.masksToBounds = false
                view.layer.shadowColor = UIColor.darkGray.cgColor
                view.layer.shadowRadius = 8
                view.layer.shadowOpacity = 0.5
                view.layer.shadowOffset = CGSize(width: 0, height: 0)
                view.layer.cornerRadius = 10
                return view
            }()
        let label : UILabel = UILabel()
        label.text = arrBanner[index]
        label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        label.frame.size = CGSize(width: (Banner.frame.size.width - 20), height: 20)
       label.frame = CGRect(x: (Int(Banner.frame.size.width/5)), y: (Int(Banner.frame.size.height/2)) , width: (Int(Banner.frame.size.width - 20)), height: 20)
        Banner.addSubview(label)
     return Banner
    }
    
    
}

