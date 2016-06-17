//
//  Contato.m
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@dynamic nome,tel,email,mail,site,img,latitude,longitude;

- (NSString*)description{
    return [NSString stringWithFormat:@"🚶: %@ 📱: %@ 📧: %@ 📮:%@ 🌐:%@",
            self.nome,self.tel,self.email,self.mail,self.site];
}

-(CLLocationCoordinate2D)coordinate{
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

-(NSString*)title{
    return self.nome;
}

-(NSString*)subtitle{
    return self.mail;
}

@end
