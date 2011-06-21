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
-(NMNewmApp *) application;
-(void)setApplication:(NMNewmApp *)val;


// A list of NSInvocation objects to call
-(NSMutableArray *) beforeFilters;
-(void)setBeforeFilters:(NSMutableArray *)val;


// This is the request used for calls
-(NMAbstractRequest *) request;
-(void)setRequest:(NMAbstractRequest *)val;


// This is the response object to write for output
-(NMAbstractResponse *) response;
-(void)setResponse:(NMAbstractResponse *)val;


// This is the default layout set at initialization time.  THIS SHOULD NOT BE MODIFIED AFTER CONTROLLER INITIALIZATION!
-(NMAbstractView *) defaultLayout;
-(void)setDefaultLayout:(NMAbstractView *)val;


// This is the layout used for the current request
-(NMAbstractView *) currentLayout;
-(void)setCurrentLayout:(NMAbstractView *)val;


// This is the action's data for use in the layout
-(NSData *) actionViewData;
-(void)setActionViewData:(NSData *)val;


@end
