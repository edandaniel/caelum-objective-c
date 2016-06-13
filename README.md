# INTRO

# Infra
MacMini

## iOS
- iPhone
- iPad
-iPad
-iWatch
-appleTV

## MacOS
- Mac

## how 2 dev
- Xcode
 -SDK

## Lang
- Objective-C / Swift

iOS          | MacOS
---
Cocoa Touch  | Cocoa (unica diferenca entre os 2)
MediaLayer   | MediaLayer
CoreServices | CoreServices
CoreOS       | ∂CoreOS

## Story Time

- Apple MacOS 9
- Steve Jobs demitido
- Cria Empresa Next
- Stepstone
— Biologia
- C com objetos
- Interface Builder
- Steve buys Stepstone, join to Next, become NextStep
- Uncle Steve goes back to Apple

# Xcode

## Storyboard | Interface Builder
- 1 arquivo
- n telas

## xib (Xcode Interface Builder)
- 1 arquivo
- 1 tela

Storyboard fala com xib
programaticamente

## iOS x Android | Simulador x Emulador
iOS: Simulador (faz de conta)
Android: Emulador (mundo real)

# Objective-C 

## .h (header)
cabecalho e definicoes
*publico*

### Comportamento de tela => UIViewController
@interface ViewController : UIViewController
":" -> extends do java (son of a...)
UIViewController é como se fosse Activity do Android

## .m (messages)
@implementation ViewController

### static / non static
- (metodo de instancia) (non static)
+ (static)

## IBAction
Interface Builder Action

## [ ] 
Objective-C trabalha com mensagens, em tempo de execucao
*[* e *]* sao usados para troca de mensagens

## NS
NextStep

## ("string exemplo %@",stringue)
Interpolacao de string

## toda classe deve ser filha de alguem 

## syntax sugar

NSString* email = [self.email text];
NSString* mail = self.mail.text; //funciona assim, mas é dangerous 

[Contato new] => [[Contato alloc] init]
[[self nome] text]

## @property
 cria getter, setter e iVar (variavel de Instancia)
