// Copyright 2011 Jonathan Bartlett

//FIXME - should the controller be holding on to a weak reference to the app?

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractRequest.h>
#import <Newm/NMAbstractResponse.h>
#import <Newm/NMAbstractView.h>
#import <Newm/NMNewmApp.h>

@class NMAbstractView;
@class NMNewmApp;

@interface NMAbstractController : NSObject {
	NMNewmApp *application;

	NSMutableArray *beforeFilters;
	NMAbstractRequest *request;
	NMAbstractResponse *response;

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

// The application that put me here
@property (assign) NMNewmApp *application;

// A list of NSInvocation objects to call
@property (retain) NSMutableArray *beforeFilters;

// This is the request used for calls
@property (retain) NMAbstractRequest *request;

// This is the response object to write for output
@property (retain) NMAbstractResponse *response;

// This is the default layout set at initialization time.  THIS SHOULD NOT BE MODIFIED AFTER CONTROLLER INITIALIZATION!
@property (retain) NMAbstractView *defaultLayout;

// This is the layout used for the current request
@property (retain) NMAbstractView *currentLayout;

// This is the action's data for use in the layout
@property (retain) NSData *actionViewData;

@end
