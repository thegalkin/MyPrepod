//
//  RequestPerformer.swift
//  MyPrepod
//
//  Created by Никита Галкин on 27.12.2020.
//

import Foundation

enum requestError: Error{
	case invalidArguments(_ requestType: String, _ requestArgumentsValues: [String])
}

public class RequestPerformer{
	public static func requestForPerson(requestType: String, requestArguments: String...) throws{
		
		let url = URL(string: "https://myprepod.ru" + requestType)!
		var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
		components.queryItems = []
		var argumentsNames = [String]()
		
		switch requestType {
			case "comments_gettop":
				argumentsNames.append("offset")
			case "personGetData":
				argumentsNames.append("id")
				argumentsNames.append("offset")
				argumentsNames.append("startId")
			case "pollsGetMark":
				argumentsNames.append("tid")
			case "personGet":
				argumentsNames.append("id")
			case "personSearch":
				argumentsNames.append("q")
				argumentsNames.append("uid")
			case "poolsGetQuestions":
				argumentsNames.append("tid") //ID препода
			default:
				throw requestError.invalidArguments(requestType, requestArguments)
		}
		
		
		for (i, argument) in requestArguments.enumerated() {
			components.queryItems?.append(URLQueryItem(name: argument, value: argumentsNames[i]))
		}
		
		
		let query = components.url!.query
		
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.httpBody = Data(query!.utf8)
	}
}

