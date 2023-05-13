

import Foundation
struct MediaMetadata : Codable {
	let url : String?
	let format : String?
	let height : Int?
	let width : Int?

	enum CodingKeys: String, CodingKey {
		case url = "url"
		case format = "format"
		case height = "height"
		case width = "width"
	}
}
