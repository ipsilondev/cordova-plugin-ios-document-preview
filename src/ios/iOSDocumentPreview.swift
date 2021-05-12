import Foundation

 @objc(CDViOSDocumentPreview) class iOSDocumentPreview : CDVPlugin, UIDocumentInteractionControllerDelegate {
    func open(command: CDVInvokedUrlCommand) {
        // run on the background thread
            // force type casting of AnyObject
            var file = command.arguments[0] as! String
            var type = command.arguments[1] as! String
            var result: CDVPluginResult?


            dispatch_async(dispatch_get_main_queue()) {
                // using print; faster then NSLog
                print("Looking for \(file) in ")

                let documentPath = NSBundle.mainBundle().pathForResource(file, ofType: type)
                let documentURL = NSURL(fileURLWithPath: documentPath!, isDirectory: false)

                let documentController = UIDocumentInteractionController(URL: documentURL)
                documentController.delegate = self

                let wasOpen = documentController.presentPreviewAnimated(true)

                if (wasOpen) {
                    result = CDVPluginResult(status: CDVCommandStatus_OK, messageAsBool: true)
                } else {
                    result = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAsBool: false)
                }

                self.commandDelegate?.sendPluginResult(result, callbackId: command.callbackId)

            }

//            dispatch_async(dispatch_get_main_queue(), ^{
//                // TODO: test if this is a URI or a path
//                NSURL *fileURL = [NSURL URLWithString:path];
//
//                localFile = fileURL.path;
//
//                NSLog(@"looking for file at %@", fileURL);
//                NSFileManager *fm = [NSFileManager defaultManager];
//                if(![fm fileExistsAtPath:localFile]) {
//                    NSDictionary *jsonObj = @{@"status" : @"9",
//                        @"message" : @"File does not exist"};
//                    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
//                        messageAsDictionary:jsonObj];
//                    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
//                    return;
//                }

    }

    func documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController) -> UIViewController {
        return self.viewController!
    }

}
