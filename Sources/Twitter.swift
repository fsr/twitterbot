import Foundation

public class Twitter {

    private let consumerKey: String
    private let consumerSecret: String

    private let session = NSURLSession(configuration: .defaultSessionConfiguration())

    public init(withYaml yamlPath: String) {
        self.consumerKey = ""
        self.consumerSecret = ""
    }

    public func post(tweet: String) {
        let url = NSURL(string: "https://twitter.com")!
        let request = NSMutableURLRequest(URL: url)

        let (data, response, error) = session.synchronousDataTaskWithRequest(request)
        print((response as! NSHTTPURLResponse).statusCode)
    }
}
