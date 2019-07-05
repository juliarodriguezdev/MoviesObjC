//
//  JJRMovie.h
//  MoviesObjc
//
//  Created by Julia Rodriguez on 7/5/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJRMovie : NSObject

// class properties

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *overview;
@property (nonatomic, readonly) double rating;

// initialize
-(instancetype)initWithTitle:(NSString *)title
                    overview:(NSString *)overview
                      rating:(double)rating;

@end

@interface JJRMovie (JSONConvertable)

//initialize a dictionary with string:any

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
