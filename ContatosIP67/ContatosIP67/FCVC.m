//
//  FORMULARIO CONTATO VIEW CONTROLLER
//  FCVC
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
            self.latitude.text = [self.contato.latitude stringValue];
            self.longitude.text = [self.contato.longitude stringValue];
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
        self.latitude.text = [self.contato.latitude stringValue];
        self.longitude.text = [self.contato.longitude stringValue];
        
        UIImage* fotoSalva = self.contato.img;
        if(fotoSalva){
            [self.botaoFoto setBackgroundImage:fotoSalva
                                  forState:UIControlStateNormal];
            [self.botaoFoto setTitle:nil
                            forState:UIControlStateNormal];
        }
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
    self.contato.img = [self.botaoFoto backgroundImageForState:UIControlStateNormal];
    self.contato.latitude = [NSNumber numberWithFloat:[self.latitude.text floatValue]];
    self.contato.longitude = [NSNumber numberWithFloat:[self.longitude.text floatValue]];
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

-(IBAction)addImg:(id)sender{
    // tira o ! desse if quando for testar no simulador senao nao mostra menu nem nada 
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController* picker = [UIImagePickerController new];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self.navigationController presentViewController:picker
                                                animated:YES
                                              completion:nil];
    }else{
        UIActionSheet* menu = [[UIActionSheet alloc]initWithTitle:@"escolha"
                                                         delegate:self //uiactionsheetdelegate
                                                cancelButtonTitle:@"cancelar"
                                           destructiveButtonTitle:nil
                                                otherButtonTitles:@"camera", @"galeria", nil];
        [menu showInView:self.view];
    }
}

 -(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
     UIImage* foto = [info valueForKey:UIImagePickerControllerEditedImage];
     [self.botaoFoto setBackgroundImage:foto
                               forState:UIControlStateNormal];
     [self.botaoFoto setTitle:@""
                     forState:UIControlStateNormal];
     [self.navigationController dismissViewControllerAnimated:YES
                                                   completion:nil];
 }

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    if(buttonIndex == 0){
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:picker
                       animated:YES
                     completion:nil];
    
}

-(IBAction)buscaCoordenadas:(UIButton*)botao{
    [self.rodinha startAnimating];
    botao.hidden = YES;
    NSString* enderecoDoContato = self.mail.text;
    CLGeocoder* geo = [CLGeocoder new];
    [geo geocodeAddressString:enderecoDoContato completionHandler:^(NSArray* resultados, NSError* erro){
        if(!erro && [resultados count]>0){
            CLPlacemark* resultado = resultados[0];
            CLLocationCoordinate2D coord = resultado.location.coordinate;
            self.latitude.text = [NSString stringWithFormat:@"%f",coord.latitude];
            self.longitude.text = [NSString stringWithFormat:@"%f",coord.longitude];
        }
        [self.rodinha stopAnimating];
        botao.hidden = NO;
    }];
;
}

@end