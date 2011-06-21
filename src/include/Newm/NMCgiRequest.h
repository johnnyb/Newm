// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractRequest.h>

#define MAX_CGI_CONTENT_LENGTH 1000000

@interface NMCgiRequest : NMAbstractRequest {
}

-(void) loadEnvironmentVariables;

@end
