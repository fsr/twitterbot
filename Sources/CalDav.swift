// AFAIK this really isn't anything related to CalDAV.
// Just polling the .ics file and working with that.

import Foundation
import Yaml

class CalDav {
    let url: NSURL
    let user: String
    let password: String

    let session = NSURLSession(configuration: .defaultSessionConfiguration())

    init(url: String, user: String, password: String) {
        self.url = NSURL(string: url)!
        self.user = user
        self.password = password
    }

    convenience init(fromConfig config: Yaml) {
        guard let calURL = config["OwnCloud"]["url"].string,
              let calUser = config["OwnCloud"]["username"].string,
              let calPass = config["OwnCloud"]["password"].string else {
                  fatalError("Error reading OwnCloud data from config file.")
              }
        self.init(url: calURL, user: calUser, password: calPass)
    }

    func getData() -> String? {
        let request = NSMutableURLRequest(URL: url)
        let authHeader = "\(user):\(password)".toBase64()
        request.addValue("Basic \(authHeader)", forHTTPHeaderField: "Authorization")

        let (data, _, _) = session.synchronousDataTaskWithRequest(request)

        if let data = data {
            return String(data: data, encoding: NSUTF8StringEncoding)
        }
        return nil
    }
}

extension CalDav: ContentProvider {
    func provideContent() -> [String] {
        return ["not configured yet"]
    }
}
