import Foundation

extension NSURLSession {
    // From http://stackoverflow.com/a/34308158/1843020
    func synchronousDataTaskWithURL(url: NSURL) -> (NSData?, NSURLResponse?, NSError?) {
        var data: NSData?, response: NSURLResponse?, error: NSError?

        let semaphore = dispatch_semaphore_create(0)

        dataTaskWithURL(url) {
            data = $0; response = $1; error = $2
            dispatch_semaphore_signal(semaphore)
        }.resume()

        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)

        return (data, response, error)
    }

    func synchronousDataTaskWithRequest(request: NSMutableURLRequest) -> (NSData?, NSURLResponse?, NSError?) {
        var data: NSData?, response: NSURLResponse?, error: NSError?

        let semaphore = dispatch_semaphore_create(0)

        dataTaskWithRequest(request) {
            data = $0; response = $1; error = $2
            dispatch_semaphore_signal(semaphore)
        }.resume()

        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)

        return (data, response, error)
    }
}

extension String {
    func toBase64() -> String {
        let data = dataUsingEncoding(NSUTF8StringEncoding)
        return data!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
}
