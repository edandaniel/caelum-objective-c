//
//  CNMVC.h
//  ContatosIP67
//
//  Created by ios6400 on 6/16/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface CNMVC : UIViewController
    @property CLLocationManager* manager;
    @property (weak,nonatomic) IBOutlet MKMapView* mapa;
@end
