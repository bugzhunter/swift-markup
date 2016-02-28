extension UIColor {
    public class func fromARGB(argb: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((argb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((argb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(argb & 0x0000FF) / 255.0,
            alpha: CGFloat((argb & 0xFF000000) >> 24) / 255.0
        )
    }
    
    public class func fromRGB(rgb: UInt) -> UIColor {
        return fromARGB(0xff000000 + rgb)
    }
}