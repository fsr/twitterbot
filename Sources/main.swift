import Yaml
import PathKit
import Foundation

// Load config
let configPath = Path.current + Path("twitterbotconf.yml")
let data = try? configPath.read()

guard let data = data else {
    fatalError("Error reading config file from \(configPath)")
}

let configData = String(data: data, encoding: NSUTF8StringEncoding)!
let config = Yaml.load(configData).value

guard let config = config else {
    fatalError("Error parsing config file data")
}

// Init Twitter
let twitter = Twitter(key: "", secret: "")

// Initialize Content Providers
let ifsrCal = CalDav(fromConfig: config)

let contentProviders = [ifsrCal]

for cp in contentProviders {
    print(cp.provideContent())
}

twitter.post("")
