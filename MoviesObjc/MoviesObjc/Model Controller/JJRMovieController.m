//
//  JJRMovieController.m
//  MoviesObjc
//
//  Created by Julia Rodriguez on 7/5/19.
//  Copyright © 2019 Julia Rodriguez. All rights reserved.
//

#import "JJRMovieController.h"

// magic strings for URL Creation

static NSString * const baseURLString = @"https://api.themoviedb.org/3/";
static NSString * const search = @"search";
static NSString * const movieString = @"movie";
static NSString * const apiKeyString = @"api_key";
static NSString * const apiKey = @"a5cd402718fc47c098a296dd7eb9c4dd";

@implementation JJRMovieController

//shared instance
+ (JJRMovieController *)sharedInstance
{
    static JJRMovieController *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [JJRMovieController new];
    });
    return sharedInstance;
}

// fetch methods implementation
+ (void)fetchMovies:(NSString *)movie completion:(void (^)(NSArray<JJRMovie *> *))completion
{
    // constructing URL
    // final url: https://api.themoviedb.org/3/search/movie?api_key=a5cd402718fc47c098a296dd7eb9c4dd&query=Spiderman
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *movieURL = [[baseURL URLByAppendingPathComponent:search] URLByAppendingPathComponent:movieString];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:movieURL resolvingAgainstBaseURL:true];
    
    // Add query items, info after ?
    NSURLQueryItem *apiQuery = [[NSURLQueryItem alloc] initWithName:apiKeyString value:apiKey];
    NSURLQueryItem *movieQuery = [[NSURLQueryItem alloc] initWithName:@"query" value:movie];
    
    urlComponents.queryItems = @[apiQuery, movieQuery];
    
    //final URL
    NSURL *finalURL = urlComponents.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
          // handle the error
          if (error)
          {
              NSLog(@"There is an error with the url : %@, %@", [error localizedDescription], error);
              completion(nil);
              return;
          }
          if (data)
          {
              // json serialization
              NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];

          if (!topLevelDictionary)
          {
              NSLog(@"Error pasing the JSON: %@, %@", [error localizedDescription], error);
              completion(nil);
              return;
          }
           NSDictionary *secondLevelDict = topLevelDictionary[@"results"];
              
              // Temporary array to store movie dictionaries
              NSMutableArray *moviesArray = [NSMutableArray new];
              
              //for a moviesDictionary in topLevelDictionary
              for (NSDictionary *moviesDictionary in secondLevelDict)
              {
                  // create a movie of type JJRMovie, initialize it with a dictionary (model)
                  JJRMovie *movie = [[JJRMovie alloc] initWithDictionary:moviesDictionary];
                  
                  //add movie found in array to empty moviesArray
                  [moviesArray addObject:movie];
                  
                  //complete with appened moviesArray
                  completion(moviesArray);
              }
              
          }
          
          }] resume];
}


@end
