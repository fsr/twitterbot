class CalDav {
    private let url: String

    init(url: String) {
        self.url = url
    }
}

extension CalDav: ContentProvider {
    func provideContent() -> [String] {
        return ["not configured yet"]
    }
}
