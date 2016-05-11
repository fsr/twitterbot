import Foundation

public class Twitter {

    private let consumerKey: String
    private let consumerSecret: String

    private let session = NSURLSession(configuration: .defaultSessionConfiguration())

    public init(key: String, secret: String) {
        consumerKey = key
        consumerSecret = secret
    }

    public func post(tweet: String) {
        let url = NSURL(string: "https://twitter.com")!
        let request = NSMutableURLRequest(URL: url)

        request.HTTPMethod = "GET"
        // request.addValue("", forHTTPHeaderField: "")

        let (data, response, error) = session.synchronousDataTaskWithRequest(request)
        print((response as? NSHTTPURLResponse)?.statusCode)
    }
}
