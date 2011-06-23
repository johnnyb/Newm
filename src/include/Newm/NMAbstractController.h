// Copyright 2011 Jonathan Bartlett

//FIXME - should the controller be holding on to a weak reference to the app?

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractRequest.h>
#import <Newm/NMAbstractResponse.h>
#import <Newm/NMAbstractView.h>
#import <Newm/NMNewmApp.h>
#import <Newm/NMAbstractSession.h>
#import <Newm/NewmMacros.h>

@class NMAbstractView;
@class NMNewmApp;

@interface NMAbstractController : NSObject {
	NMNewmApp *application;

	NSMutableArray *beforeFilters;
	NMAbstractRequest *request;
	NMAbstractResponse *response;

	NMAbstractSession *session;

	NMCookieJar *cookieJar;	

	NMAbstractView *defaultLayout;
	NMAbstractView *currentLayout;

	NSData *actionViewData;
} 

-(void) addBeforeFilterWithSelector:(SEL)filter;
-(void) addBeforeFilterWithInvocation:(NSInvocation *)inv;
-(void) reset;
-(void) runBeforeFilters;
-(void) runActionNamed:(NSString *)actionName;
-(NMAbstractView *) viewForActionName:(NSString *)name format:(NSString *)format;
-(void) prepareResponseForSendingHeaders;

// The application that put me here
OBJC_ACC_DECL(NMNewmApp *, application, setApplication)

// A list of NSInvocation objects to call
OBJC_ACC_DECL(NSMutableArray *, beforeFilters, setBeforeFilters)

// This is the request used for calls
OBJC_ACC_DECL(NMAbstractRequest *, request, setRequest)

// This is the response object to write for output
OBJC_ACC_DECL(NMAbstractResponse *, response, setResponse)

// This is the default layout set at initialization time.  THIS SHOULD NOT BE MODIFIED AFTER CONTROLLER INITIALIZATION!
OBJC_ACC_DECL(NMAbstractView *, defaultLayout, setDefaultLayout)

// This is the layout used for the current request
OBJC_ACC_DECL(NMAbstractView *, currentLayout, setCurrentLayout)

// This is the action's data for use in the layout
OBJC_ACC_DECL(NSData *, actionViewData, setActionViewData)

// This is the session object
OBJC_ACC_DECL(NMAbstractSession *, session, setSession)

// These are the outgoing cookies
OBJC_ACC_DECL(NMCookieJar *, cookieJar, setCookieJar)

@end
