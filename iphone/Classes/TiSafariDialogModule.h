/**
 * Ti.SafariDialog
 *
 * Created by Ben Bahrenburg (bencoding)
 * Copyright (c) 2015 Ben Bahrenburg (bencoding). All rights reserved.
 */

#import "TiModule.h"
#import <SafariServices/SafariServices.h>

@interface TiSafariDialogModule : TiModule<SFSafariViewControllerDelegate>{
@private
    SFSafariViewController* _sfVC;
    NSString* _url;
    BOOL _isOpen;
}

@end
