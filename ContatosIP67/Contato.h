//
//  Contato.h
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Contato : NSObject<MKAnnotation>
    @property NSString * nome;
    @property NSString * tel;
    @property NSString * email;
    @property NSString * mail;
    @property NSString * site;
    //foto
    @property UIImage * img;
    //- (NSString*)description;
    @property NSNumber* latitude;
    @property NSNumber* longitude;
@end

@protocol MKAnnotation <NSObject>

@required
-(CLLocationCoordinate2D)coordinate;
@optional
-(NSString*)title;
-(NSString*)subtitle;

@end