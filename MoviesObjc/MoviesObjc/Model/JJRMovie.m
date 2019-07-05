//
//  JJRMovie.m
//  MoviesObjc
//
//  Created by Julia Rodriguez on 7/5/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

#import "JJRMovie.h"

//magic strings

static NSString * const titleKey = @"title";
static NSString * const ratingKey = @"vote_average";
static NSString * const overviewKey = @"overview";

@implementation JJRMovie

- (instancetype)initWithTitle:(NSString *)title overview:(NSString *)overview rating:(double)rating
{
    self = [super init];
    if (self) {
        _tite = title;
        _overview = overview;
        _rating = rating;
    }
    return self;
}

@end

@implementation JJRMovie (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *title = dictionary[titleKey];
    double rating = [dictionary[ratingKey] doubleValue];
    NSString *overview = dictionary[overviewKey];
    
    return [self initWithTitle:title overview:overview rating:rating];
    
}

@end
