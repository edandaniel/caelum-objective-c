//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "FCVC.h"
#import "Contato.h"

@interface FCVC ()

@end

@implementation FCVC
-(NSObject*) initWithCoder:(NSCoder*)aDecoder {
    self = [super initWithCoder: aDecoder]; // retorna pra propria classe a inicalizacao default (super pega da classe mae)
    if(self){
        if(self.contato){
            UIBarButtonItem* alterar = [[UIBarButtonItem alloc] initWithTitle:@"Change🌀"
                                                                        style:UIBarButtonItemStylePlain
                                                                       target:self
                                                                       action:@selector(atualizaContato)];
            self.navigationItem.rightBarButtonItem = alterar;
        }else{
            UIBarButtonItem* adicionar = [[UIBarButtonItem alloc] initWithTitle:@"Add➕"
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:@selector(adicionaContato)];
            self.navigationItem.rightBarButtonItem = adicionar;
        }

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
        self.navigationItem.title = @"Change🌀";
        UIBarButtonItem* confirmar = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar❓"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(atualizaContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
        
        //recupera dados ja salvos para o formulario
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

- (void)getFormData{
    if(!self.contato){
        self.contato = [Contato new];
    }
    _contato.nome = self.nome.text; //_ ou self da na mesma
    self.contato.tel = self.tel.text;
    self.contato.email = self.email.text;
    self.contato.mail = self.mail.text;
    self.contato.site = self.site.text;
}

-(void)adicionaContato{//TODO criacontato
    [self getFormData];
    [self.dao adiciona:_contato];
    
    if(self.delegate){
        [self.delegate contatoAdicionado:self.contato];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)atualizaContato{
    [self getFormData];

    if(self.delegate){
        [self.delegate contatoAtualizado:self.contato];
    }

    [self.navigationController popViewControllerAnimated:YES];
    //[self.lista highlightNoContato:self.contato];
}


@end
