// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import "NMAbstractRequest.h"
#import "NMAbstractResponse.h"

@interface NMAbstractController : NSObject {
	NSMutableArray *beforeFilters;
	NMAbstractRequest *request;
	NMAbstractResponse *response;
} 

-(void) addBeforeFilterWithSelector:(SEL)filter;
-(void) addBeforeFilterWithInvocation:(NSInvocation *)inv;
-(void) reset;
-(void) runBeforeFilters;
-(void) runActionNamed:(NSString *)actionName;
-(void) runAction:(SEL)selector;

// A list of NSInvocation objects to call
@property (retain) NSMutableArray *beforeFilters;

// This is the request used for calls
@property (retain) NMAbstractRequest *request;
@property (retain) NMAbstractResponse *response;

@end
