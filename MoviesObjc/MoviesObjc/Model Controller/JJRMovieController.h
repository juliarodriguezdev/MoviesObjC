//
//  JJRMovieController.h
//  MoviesObjc
//
//  Created by Julia Rodriguez on 7/5/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJRMovie.h"

@interface JJRMovieController : NSObject

// singleton
+ (instancetype) sharedInstance;

// method to fetch movies
+ (void)fetchMovies:(NSString *)movie completion:(void(^)(NSArray<JJRMovie *> *movies))completion;


@end


