// Copyright 2011 Jonathan Bartlett

#import <Newm/NMRoute.h>
#import <Newm/NSDictionary+Newm.h>
#import <Newm/NSArray+Newm.h>

@implementation NMRoute

@synthesize path;
@synthesize extraParams;
@synthesize pathComponents;

+(NMRoute *)routeWithPath:(NSString *)rpath params:(NSDictionary *)p {
	return [[[NMRoute alloc] initWithPath:rpath params:p] autorelease];
}

-(id) initWithPath:(NSString *)rpath params:(NSDictionary *)p {
	self = [super init];

	self.path = rpath;
	self.pathComponents = [[path componentsSeparatedByString:@"/"] arrayByTrimming];
	self.extraParams = p;

	return self;
}

-(void) applyToRequest:(NMAbstractRequest *)req {
	[req.params addEntriesFromDictionary:extraParams];
	NSArray *reqPathComps = [[req.pathInfo componentsSeparatedByString:@"/"] arrayByTrimming];
	int i;
	for(i = 0; i < pathComponents.count; i++) {
		NSString *pcomp = [pathComponents objectAtIndex:i];
		if([pcomp characterAtIndex:0] == ':') {
			NSString *newkey = [pcomp substringFromIndex:1];
			NSString *newval = [reqPathComps objectAtIndex:i];
			if(newval != nil) {
				[req.params setObject:newval forKey:newkey];
			}
		}
	}
}

-(BOOL) matchesRequest:(NMAbstractRequest *)req {
	int i;

	NSArray *reqPathComps = [[req.pathInfo componentsSeparatedByString:@"/"] arrayByTrimming];

	if(pathComponents.count != reqPathComps.count) {
		return NO;
	}
	for(i = 0; i < pathComponents.count; i++) {
		NSString *pcomp = [pathComponents objectAtIndex:i];
		if([pcomp characterAtIndex:0] != ':') {
			NSString *rpcomp = [reqPathComps objectAtIndex:i];
			if(![rpcomp isEqualToString:pcomp]) {
				return NO;
			}
		}
	}

	return YES;
}

-(NSString *) pathFromParams:(NSDictionary *)p {
	NSMutableArray *newPathComponents = [NSMutableArray arrayWithCapacity:(pathComponents.count + 2)];
	NSMutableDictionary *pathDict = [p mutableCopy];

	for(NSString *key in [extraParams allKeys]) {
		NSString *val = [extraParams objectForKey:key];
		NSString *pdVal = [pathDict objectForKey:key];
		if(![pdVal isEqual:val]) {
			return nil;
		} else {
			[pathDict removeObjectForKey:key];
		}
	}

	int i;	
	for(i = 0; i < pathComponents.count; i++) {
		NSString *pcomp = [pathComponents objectAtIndex:i];
		if([pcomp characterAtIndex:0] != ':') {
			NSString *key = [pcomp substringFromIndex:1];
			NSString *val = [pathDict objectForKey:key];
			if(val == nil) {
				//Can't generate a path for this route
				return nil;
			} else {
				[pathDict removeObjectForKey:key];
				[newPathComponents addObject:val];
			}
		} else {
			[newPathComponents addObject:pcomp];
		}
	}

	NSString *newPathString = [@"/" stringByAppendingString:[newPathComponents componentsJoinedByString:@"/"]];

	if(pathDict.count > 0) {
		newPathString = [newPathString stringByAppendingString:@"?"];
		NSString *queryString = [pathDict URLQueryString];
		newPathString = [newPathString stringByAppendingString:queryString];
	}

	return newPathString;
}


-(void) dealloc {
	[path release];
	[extraParams release];
	[pathComponents release];

	[super dealloc];
}

@end
