#import "Foundation/Foundation.h"
#import "NMAbstractRequest.h"

@interface NMCgiRequest : NMAbstractRequest {
}

-(void) loadEnvironmentVariables;

@end
