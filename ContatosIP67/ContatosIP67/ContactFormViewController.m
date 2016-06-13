//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContactFormViewController.h"

@interface ContactFormViewController ()


@end

@implementation ContactFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getFormData{
    NSString* nome = [self.nome text];
    NSString* tel = [self.tel text];
    NSString* email = [self.email text];
    NSString* mail = [self.mail text];
    NSString* site = [self.site text];
    
    NSLog(@"\nnombre del hombre🚶: %@\ntelefone del cabrone 📱: %@\nemail 📧: %@\ndereço 📮:%@\nsite🌐:%@",nome,tel,email,mail,site);
}

@end
