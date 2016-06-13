//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContactFormViewController.h"
#import "Contato.h"

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
    Contato* contato = [Contato new];
    contato.nome = self.nome.text;
    contato.tel = self.tel.text;
    contato.email = [self.email text];
    contato.mail = [self.mail text];
    contato.site = self.site.text;
    
    [self.dao adiciona:contato];
    NSLog(@"%@",contato);
}

- (NSObject*) init {
    self = [super init]; // retorna pra propria classe a inicalizacao default (super pega da classe mae)
    if(self){ //self!=nil
        /*array imutavel
        self.contactos = [NSArray new];
        _contactos = [_contactos addObject:@"John"];
        _contactos = [_contactos addObject:42];
        [_contactos count];*/
        
        //array mutavel
        self.dao = [ContatoDAO new];
    }
    return self;
}

@end
