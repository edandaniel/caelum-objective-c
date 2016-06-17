//
//  CONTATOS NO MAPA VIEW CONTROLLER
//  CNMVC.m
//  ContatosIP67
//
//  Created by ios6400 on 6/16/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "CNMVC.h"

@interface CNMVC ()

@end

@implementation CNMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    MKUserTrackingBarButtonItem* botaoGps = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapa];
    self.navigationItem.rightBarButtonItem = botaoGps;
    self.manager = [CLLocationManager new];
    [_manager requestAlwaysAuthorization];
    [_manager requestWhenInUseAuthorization];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    ContatoDAO* dao =[ContatoDAO instancia];
    [self.mapa addAnnotations:dao.contatos];
}

-(void)viewDidDisappear:(BOOL)animated{
    ContatoDAO *dao = [ContatoDAO instancia];
    [self.mapa removeAnnotations:dao.contatos];
}

-(id)init{
    self = [super init];
    if(self){
        UIImage* iconeMapa = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem* tab = [[UITabBarItem alloc] initWithTitle:@"Mapa"
                                                          image:iconeMapa
                                                            tag:1];
        self.tabBarItem = tab;
        self.navigationItem.title = @"lokalizacao";
    }
    return self;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
