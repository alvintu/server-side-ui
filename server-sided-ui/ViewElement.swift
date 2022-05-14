//
//  ViewElement.swift
//  server-sided-ui
//
//  Created by Alvin Tu on 5/14/22.
//

struct ViewElement: Codable{
	var type: String
	var height: Int
	var font_size: String
	var text: String
	var font_weight: String
	var alignment: String
	var color: String


	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decode(String.self, forKey: .type)
		height = try values.decodeIfPresent(Int.self, forKey: .height) ?? 0
		text = try values.decodeIfPresent(String.self, forKey: .text) ?? ""
		font_size = try values.decodeIfPresent(String.self, forKey: .font_size) ?? ""
		font_weight = try values.decodeIfPresent(String.self, forKey: .font_weight) ?? ""
		alignment = try values.decodeIfPresent(String.self, forKey: .alignment) ?? ""
		color = try values.decodeIfPresent(String.self, forKey: .color) ?? ""
	}
	}


