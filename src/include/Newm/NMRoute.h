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

-(NSString *) path;
-(void)setPath:(NSString *)val;

-(NSDictionary *) extraParams;
-(void)setExtraParams:(NSDictionary *)val;

-(NSArray *) pathComponents;
-(void)setPathComponents:(NSArray *)val;


@end
