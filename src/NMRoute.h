// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import "NMAbstractRequest.h"

@interface NMRoute : NSObject {
}

+(NMRoute *)routeWithPath:(NSString *)rpath params:(NSDictionary *)p;

-(BOOL) matchesRequest:(NMAbstractRequest *)req;
-(void) applyToRequest:(NMAbstractRequest *)req;

@end
