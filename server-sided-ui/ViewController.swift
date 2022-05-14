//
//  ViewController.swift
//  server-sided-ui
//
//  Created by Alvin Tu on 5/14/22.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		guard let elements = loadJson(filename: "response") else { return }
		var views : [UIView] = []
		for element in elements {
			if element.type == "space" {
				let space = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: element.height))
				space.backgroundColor = .green
				views.append(space)
			}
			
			if element.type == "text" {
				let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
				label.text = element.text
				label.textColor = .white
				
				label.backgroundColor = .black
				views.append(label)

			}
		}
			print(views)
		
			self.verticallyLayoutViews(views, in: view)
			
		

		// Do any additional setup after loading the view.
	}
		

		func verticallyLayoutViews(_ views: [UIView], in parent: UIView) {
			
			var previousView: UIView?
			
			views.forEach { view in
				view.translatesAutoresizingMaskIntoConstraints = false
				parent.addSubview(view)
				if let previousView = previousView {
					parent.addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: previousView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
				}
				parent.addConstraint(NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: parent, attribute: .left, multiplier: 1.0, constant: 0.0))
				parent.addConstraint(NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: parent, attribute: .right, multiplier: 1.0, constant: 0.0))
				
				previousView = view
			}
			
			// Set first constraint
			if let first = views.first {
				parent.addConstraint(NSLayoutConstraint(item: first, attribute: .top, relatedBy: .equal, toItem: parent, attribute: .top, multiplier: 1.0, constant: 0.0))
				// Set last constraint
				if let last = previousView {
					parent.addConstraint(NSLayoutConstraint(item: last, attribute: .bottom, relatedBy: .equal, toItem: parent, attribute: .bottom, multiplier: 1.0, constant: 0.0))
				}
			}
			
			
		}
	
	func loadJson(filename fileName: String) -> [ViewElement]? {
		if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
			do {
				let data = try Data(contentsOf: url)
				let decoder = JSONDecoder()
				let jsonData = try decoder.decode([ViewElement].self, from: data)
				return jsonData
			} catch {
				print("error:\(error)")
			}
		}
		return nil
	}



}

