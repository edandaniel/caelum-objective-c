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
-(NSObject*) initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder: aDecoder]; // retorna pra propria classe a inicalizacao default (super pega da classe mae)
    if(self){
        UIBarButtonItem* adicionar = [[UIBarButtonItem alloc] initWithTitle:@"Add➕"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(adicionaContato)];
        self.navigationItem.rightBarButtonItem = adicionar;
        self.dao = [ContatoDAO instancia]; //NAO BOTA NEW AQUI , SENAO NAO APARECE NADA!!!
        
        if(self.contato){
            self.nome.text = self.contato.nome; //jeito de fazer com dot notation, ez pz
            [[self tel]setText:[[self contato]tel]];//jeito masoquista de fazer, pls no
            [[self mail]setText:self.contato.mail];//mistura dos 2 de cima so pra mostrar que da pra fazer
            self.email.text = self.contato.email;
            self.site.text = self.contato.site;
        }
    }
    self.navigationItem.title=@"🎳🎪";
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(self.contato){
        self.nome.text = self.contato.nome; //jeito de fazer com dot notation, ez pz
        [[self tel]setText:[[self contato]tel]];//jeito masoquista de fazer, pls no
        [[self mail]setText:self.contato.mail];//mistura dos 2 de cima so pra mostrar que da pra fazer
        self.email.text = self.contato.email;
        self.site.text = self.contato.site;
    }
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
    //NSLog(self.dao);
    //NSLog(@"%@",contato);
}

-(void)adicionaContato{
    [self getFormData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
