// Copyright 2011 Jonathan Bartlett

#import <Foundation/Foundation.h>
#import <Newm/NMAbstractRequest.h>
#import <Newm/NMAbstractRoute.h>

@interface NMRoute : NSObject<NMAbstractRoute> {
	NSString *path;
	NSDictionary *extraParams;
	NSArray *pathComponents;
}

+(NMRoute *)routeWithPath:(NSString *)rpath params:(NSDictionary *)p;
-(id) initWithPath:(NSString *)rpath params:(NSDictionary *)p;

@property (retain) NSString *path;
@property (retain) NSDictionary *extraParams;
@property (retain) NSArray *pathComponents;

@end
