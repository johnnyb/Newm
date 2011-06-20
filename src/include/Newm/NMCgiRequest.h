// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractRequest.h>

@interface NMCgiRequest : NMAbstractRequest {
}

-(void) loadEnvironmentVariables;

@end
