//
//  FORMULARIO CONTATO VIEW CONTROLLER
//  FCVC
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatoDAO.h"

@protocol FCVCDelegate <NSObject>
    -(void)contatoAtualizado:(Contato*)contato;
    -(void)contatoAdicionado:(Contato*)contato;
@end

@interface FCVC : UIViewController
	@property (weak) id<FCVCDelegate> delegate;
    // * pode ir nos 3 lugares que da certo
    @property IBOutlet UITextField *nome;
    @property IBOutlet UITextField* tel;
    @property IBOutlet UITextField * email;
    @property IBOutlet UITextField* mail;
    @property IBOutlet UITextField *site;
	//@property id <Pintor> delegate;
    //arrays
    @property NSArray* contactos;
    @property ContatoDAO* dao;

    //importante ter senao o jow nao ve
    - (IBAction)getFormData;
    @property IBOutlet Contato* contato;
@end
