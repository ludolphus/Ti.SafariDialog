/**
 * Ti.SafariDialog
 *
 * Copyright (c) 2009-2015 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiModule.h"
#if IS_XCODE_7
#import <SafariServices/SafariServices.h>
@interface TiSafaridialogModule :TiModule<SFSafariViewControllerDelegate>{
#else
@interface TiSafaridialogModule :TiModule{
#endif
@private
    #if IS_XCODE_7
    SFSafariViewController* _sfController;
    #endif
    NSString* _url;
    BOOL _isOpen;
}

@end
