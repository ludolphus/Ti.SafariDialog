/**
 * Ti.SafariViewController
 *
 * Created by Ben Bahrenburg (bencoding)
 * Copyright (c) 2015 Ben Bahrenburg (bencoding). All rights reserved.
 */

@interface TiSafariViewControllerModuleAssets : NSObject
{
}
- (NSData*) moduleAsset;
- (NSData*) resolveModuleAsset:(NSString*)path;

@end
