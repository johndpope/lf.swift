import Foundation
import AVFoundation

public class LFView: NSView {

    public static var defaultBackgroundColor:NSColor = NSColor.blackColor()

    public var videoGravity:String = AVLayerVideoGravityResizeAspect {
        didSet {
            layer?.setValue(videoGravity, forKey: "videoGravity")
        }
    }

    override public init(frame: NSRect) {
        super.init(frame: frame)
        awakeFromNib()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func awakeFromNib() {
        wantsLayer = true
        layer = AVCaptureVideoPreviewLayer()
        layer?.backgroundColor = LFView.defaultBackgroundColor.CGColor
        layer?.setValue(videoGravity, forKey: "videoGravity")
    }

    public func attachStream(stream:Stream?) {
        layer?.setValue(stream?.mixer.session, forKey: "session")
    }
}