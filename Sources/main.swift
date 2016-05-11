let twitter = Twitter(withYaml: "")

// Initialize Content Providers
let ifsrCalDav = CalDav(url: "url")

let contentProviders = [ifsrCalDav]

for cp in contentProviders {
    print(cp.provideContent())
}

twitter.post("")
