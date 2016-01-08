import Foundation

 @objc(CDViOSDocumentPreview) class iOSDocumentPreview : CDVPlugin {
    func open(command: CDVInvokedUrlCommand) {
        let file = command.arguments[0] as String
        let type = command.arguments[1] as String

        var pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAsString: "Hello \(message)")
        commandDelegate.sendPluginResult(pluginResult, callbackId:command.callbackId)
    }
}
