protocol VCBuildable {
    
    associatedtype BuildType
    
    func build() -> BuildType
}
