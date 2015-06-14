/**
 * Ti.SafariViewController
 *
 * Created by Ben Bahrenburg (bencoding)
 * Copyright (c) 2015 Ben Bahrenburg (bencoding). All rights reserved.
 */

#import "TiModule.h"
#import <SafariServices/SFSafariViewController.h>

@interface TiSafariViewControllerModule : TiModule<SFSafariViewControllerDelegate>
{
    @private
    SFSafariViewController* _sfVC;
    NSString* _url;
    BOOL _isOpen;
    
}

@end
