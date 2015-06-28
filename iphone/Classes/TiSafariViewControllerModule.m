/**
 * Ti.SafariViewController
 *
 * Created by Ben Bahrenburg (bencoding)
 * Copyright (c) 2015 Ben Bahrenburg (bencoding). All rights reserved.
 */

#import "TiSafariViewControllerModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation TiSafariViewControllerModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"cdb36e6b-25e2-4da2-b703-d4f1416e7c5e";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"Ti.SafariViewController";
}

#pragma mark Lifecycle

-(void)startup
{
    _isOpen = NO;
	[super startup];
}

-(void)shutdown:(id)sender
{
	[super shutdown:sender];
}

#pragma mark Cleanup


#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	[super didReceiveMemoryWarning:notification];
}


-(void)teardown
{
    if(_sfVC!=nil)
    {
        _sfVC.delegate = nil;
        _sfVC = nil;
    }
    _isOpen = NO;
    if ([self _hasListeners:@"closed"])
    {
        NSDictionary *event = [NSDictionary dictionaryWithObject:NUMINT(YES) forKey:@"success"];
        [self fireEvent:@"closed" withObject:event];
    }
}

#pragma mark Listener Notifications
- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller
{
    [[TiApp app] hideModalController:controller animated:YES];
    [self teardown];
}

-(SFSafariViewController*)sfController:(NSString*)url withEntersReaderIfAvailable:(BOOL)entersReaderIfAvailable
{
    if(_sfVC == nil)
    {
        _sfVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] entersReaderIfAvailable:entersReaderIfAvailable];
        _sfVC.delegate = self;
    }
    
    return _sfVC;
}

#pragma Public APIs

-(NSNumber*)isSupported:(id)unused
{
    return NUMBOOL((NSClassFromString(@"SFSafariViewController") !=nil ));
}

-(void)close:(id)unused
{
    ENSURE_UI_THREAD(close,unused);
    
    if(_sfVC!=nil)
    {
        [[TiApp app] hideModalController:_sfVC animated:YES];
        [self teardown];
    }
    _isOpen = NO;
}

-(void)open:(id)args
{
    ENSURE_SINGLE_ARG(args,NSDictionary);
    ENSURE_UI_THREAD(open,args);
    
    if(NSClassFromString(@"SFSafariViewController") ==nil )
    {
        NSLog(@"[ERROR] SFSafariViewController not supported");
        return;
    }
    
    NSString *url = [TiUtils stringValue:@"url" properties:args];
    BOOL animated = [TiUtils boolValue:@"animated" properties:args def:YES];
    BOOL entersReaderIfAvailable = [TiUtils boolValue:@"entersReaderIfAvailable" properties:args def:YES];

    SFSafariViewController* safari = [self sfController:url withEntersReaderIfAvailable:entersReaderIfAvailable];
    
    if([args objectForKey:@"title"])
    {
        safari.title = [TiUtils stringValue:@"title" properties:args];
    }
        
    [[TiApp app] showModalController:safari animated:animated];
    
    _isOpen = YES;
    
    if ([self _hasListeners:@"opened"])
    {
        NSDictionary *event = [NSDictionary dictionaryWithObject:NUMINT(YES) forKey:@"success"];
        [self fireEvent:@"opened" withObject:event];
    }
    
}

@end
