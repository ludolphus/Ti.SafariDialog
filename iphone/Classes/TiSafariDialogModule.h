/**
 * Ti.SafariDialog
 *
 * Copyright (c) 2009-2015 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiModule.h"
#import <SafariServices/SafariServices.h>
<<<<<<< HEAD
=======

>>>>>>> parent of 89b96eb... add Xcode 7 macros
@interface TiSafaridialogModule :TiModule<SFSafariViewControllerDelegate>{
#else
@interface TiSafaridialogModule :TiModule{
#endif
@private
    SFSafariViewController* _sfController;
    NSString* _url;
    BOOL _isOpen;
}

@end
