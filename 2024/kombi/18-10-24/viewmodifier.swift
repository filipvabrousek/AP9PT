
struct Mod: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content.border(color, width: 8)
    }
}

extension View {
    func colored(_ cls: Color) -> some View {
        self.modifier(Mod(color: cls))
    }
}



struct GenericView: View {
    @State var show = false
    var body: some View {
        Button("Show"){
            show.toggle()
        }.colored(.gray)
        //.modifier(Mod())
    }
}
