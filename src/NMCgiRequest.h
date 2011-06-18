// Copyright 2011 Jonathan Bartlett

#import "Foundation/Foundation.h"
#import "NMAbstractRequest.h"

@interface NMCgiRequest : NMAbstractRequest {
}

-(void) loadEnvironmentVariables;

@end
