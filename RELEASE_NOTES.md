# Versão 1.9 (MCassador)

## O que mudou

- **O ponteiro agora acerta de qualquer direção.** A bolinha vermelha já seguia o controle direito para qualquer lado, mas o jogo só aceitava o que você apontava quando você estava de frente para o quadro da HUD. Virado de lado ou de costas, a bolinha ficava certinha em cima do alvo e nada acontecia: os fragmentos de estrela não eram pegos e os inimigos não paravam.
  - **Por que acontecia:** a cada quadro, depois que o mod entrega a posição do ponteiro, o jogo ainda pergunta ao Wiimote do Dolphin se ele está apontando para a tela. O Dolphin calcula isso contra a tela plana da HUD, que fica parada na frente da sala; com você virado para outro lado ele respondia "fora da tela", e o jogo desligava o ponteiro antes de testar qualquer alvo.
  - **O que mudou:** enquanto o mod controla o ponteiro, essa resposta do Dolphin é ignorada e o jogo continua usando a posição do mod, de qualquer ângulo. Onde volta o ponteiro normal do jogo (conversas, cenas, pausa, menus e escolhas de Sim/Não) nada muda, e a câmera que gira quando o ponteiro encosta na borda da tela continua como antes.
  - Vem dentro do código *Ponteiro livre (VR)*, que já vem ligado; não precisa ligar nada.
  - Detalhe técnico: no `updateDpdInfo` do `StarPointerController` (Galaxy 1 americano, RMGE01), o caminho "fora da tela" grava 0 no byte "na tela" do controle; a instrução que carrega esse 0 (`li r0,0` em `0x80385318`) passou a chamar uma rotina de 8 instruções que devolve 1 quando o mod está controlando o ponteiro do 1º controle. O resto do caminho mantém a posição do mod.
- Mesmo conserto da versão 0.9 do Super Mario Galaxy 2 VR, onde foi testado com o Yoshi.

## Atualizando

Rode `instalar-smg-vr.bat` de novo, com o Dolphin fechado. O seu `smgvr-menu.ini` é mantido.

---

# Versão 1.8 (MCassador)

## O que mudou

- **Corpo e braços acompanham o seu corpo de verdade:** ao virar o corpo na vida real (até dar a volta inteira) ou esticar os braços, o peito do Mario vira para onde estão as suas mãos e cada braço sai do ombro do lado certo. Antes, de costas para a frente da sala, os braços cruzavam e torciam, e esticar piorava.
- **Room scale na hora:** ao andar, dar um passo ou virar o corpo, a câmera continua em cima do corpo do Mario no mesmo instante (sobra só uma folga de 5 cm para inclinar a cabeça). Antes ela esperava você ficar parado e, sem recentralizar o óculos, às vezes não voltava.
- **Ponteiro de estrela livre na 1ª pessoa:** ele segue o controle direito para qualquer lado, também olhando para os lados, para cima ou para trás (antes parava na borda do quadro da HUD). O jogo procura o que você aponta na linha do controle, os fragmentos de estrela saem nessa direção e o mod desenha uma bolinha vermelha na ponta. Em conversas, cenas, pausa, menus e escolhas de Sim/Não volta o ponteiro normal do jogo. Novo código no jogo: *Ponteiro livre (VR)* (já vem ligado).

## Atualizando

Rode `instalar-smg-vr.bat` de novo, com o Dolphin fechado. O seu `smgvr-menu.ini` é mantido.

---

# Versão 1.7 (MCassador)

## O que mudou

- **HUD no pulso só na 1ª pessoa e só dentro da fase:** o painel não aparece mais nos menus; na câmera 200 e na câmera do jogo volta a HUD original.
- **Câmera 200 e câmera do jogo:** ao levantar, sentar ou dar um passo, a câmera volta para trás do Mario em cerca de um segundo (antes ficava deslocada).

## Atualizando

Rode `instalar-smg-vr.bat` de novo, com o Dolphin fechado. O seu `smgvr-menu.ini` é mantido.

---

# Versão 1.6 (MCassador)

## O que mudou

- **Corpo e braços não somem mais depois de um pulo ou mortal:** em tombos o corpo é recolhido por um instante, mas às vezes ficava recolhido até trocar de câmera.
- **HUD da fase** (menu do mod, aba **Jogo**): *Fixa (como o jogo)* (padrão), *Segue a cabeça* (vida, moedas, fragmentos e estrelas deslizam para onde você olha) ou *No pulso esquerdo*:
  - **1ª pessoa:** levante a mão esquerda como quem olha um relógio, com as costas da mão para você, e aparece um painel 3D no pulso, uma linha embaixo da outra: Vida, Estrelas, Moedas, Fragmentos e Mario (vidas). Abaixando a mão, ele some.
  - **Câmera 200 e 3ª pessoa:** o mesmo painel fica sempre visível, no canto de baixo à esquerda da visão.
  - Os ícones são os do jogo quando você tem o pacote de texturas HD instalado no Dolphin (`Load\Textures\<ID do jogo>`); sem ele, o painel usa formas simples.

## Atualizando

Rode `instalar-smg-vr.bat` de novo, com o Dolphin fechado. O seu `smgvr-menu.ini` é mantido.

---

# Versão 1.5 (MCassador)

Correções que vieram do trabalho no Galaxy 2.

## O que mudou

- **Pausa só no botão Menu do controle esquerdo:** na câmera original, empurrar o analógico direito para a esquerda (botão − do Wiimote) abria a pausa. O − não pausa mais.
- **Rastro do braço ao girar a visão:** ao girar com o analógico direito (em passos ou suave) o braço não deixa mais um "vulto" para o lado oposto por um ou dois quadros.
- **Imagem de abertura e tela fixa:** a imagem de abertura não cobre mais o menu do mod (B + Y), e ela e a tela fixa dos vídeos voltam para a sua frente quando você recentraliza a visão.

## Atualizando

Rode `instalar-smg-vr.bat` de novo, com o Dolphin fechado. O seu `smgvr-menu.ini` é mantido.

---

# Versão 1.4 (MCassador)

As câmeras, os braços e o menu do Galaxy 1 agora seguem o que foi feito para o Galaxy 2.

## O que mudou

- **Câmeras iguais às do Galaxy 2:** novos padrões de altura do olho (+20 cm) e de câmera à frente (12,5 cm), que aparecem como **0** no menu; giro do analógico direito em 45°; a terceira pessoa é a **câmera original do jogo** (a "atrás do Mario, nivelada" continua no menu, aba **Câmeras**: *Atrás do Mario, nivelada*).
- **A câmera acompanha** o Mario ao correr rápido e ao nadar (o olho segue a cabeça quando o corpo inclina).
- **Nado:** debaixo d'água o nariz do Mario vai para onde a cabeça olha (menu, aba **Jogo**: *Direção (voo e nado)*).
- **Voo de planeta para planeta:** durante o voo só os braços e as luvas aparecem, e a pose de "pendurado" não liga e desliga mais.
- **Braços:** não esticam nem torcem demais ao virar as mãos. Em tombos e ferimentos o corpo é recolhido (só braços e luvas), então as mãos e o corpo não ficam transparentes. Nadando e na Estrela Vermelha o corpo continua inteiro.
- **Room scale:** a **altura** também se recentraliza sozinha quando você senta ou levanta e fica ali. Isso exige *Agachar de verdade* **desligado** (agora é o padrão).
- **Corte por distância** (menu, aba **Jogo**): não desenha o que está além de 80 m (padrão *Perto*; também *Médio* 150 m, *Longe* 300 m ou *Desligado*). Pausa sozinho em cenas, conversas e voos rápidos.
- **Velocidade normal em FPS alto:** código novo no jogo e opção *Velocidade do jogo em FPS alto* (padrão: *Acelera com o FPS*; *Normal* mantém 60 passos por segundo com 72 ou mais quadros).
- **Giro suave** do analógico direito (opcional): menu, aba **Câmeras**: *Tipo de giro* e *Velocidade do giro suave*. O padrão continua em passos.
- **Menu novo:** mais largo e fácil de ler, **em português e inglês** (*Idioma / Language*, primeira linha da aba **Câmeras**).

## Atualizando

Rode `instalar-smg-vr.bat` de novo, com o Dolphin fechado. O seu `smgvr-menu.ini` é mantido, mas os ajustes de câmera *frente / trás*, *acima / abaixo* e *à frente: andando/pulando* mudaram de nome: **os valores salvos antes não são lidos** e voltam ao padrão novo. As opções novas entram com os valores padrão.

---

# Versão 1.3 (MCassador)

Instalador mais seguro e créditos ao Dolphin VR Redux. **A camada VR e os códigos do jogo são os mesmos da versão 1.2** (nada muda dentro do jogo).

## O que mudou

- **Instalador (`instalar-smg-vr.bat`) mais seguro**, para quem usa também o mod do Super Mario Galaxy 2 (https://github.com/MCassador/SuperMarioGalaxy2-VR):
  - nunca troca uma `smgvr_layer.dll` **mais nova** por uma mais antiga (instalar este zip depois do do Galaxy 2 deixava o Galaxy 2 com uma camada antiga);
  - tira do registro do OpenXR as **outras cópias** da mesma camada (por exemplo a do pacote portátil do Galaxy 2): duas cópias carregadas ao mesmo tempo duplicavam o menu e os ajustes da câmera.
- **Créditos ao Dolphin VR Redux**: feito por **iChris4 (Christophe)**, https://github.com/iChris4/dolphinXR. Nome e link no README, no CREDITS, no INSTALL e no THIRD-PARTY.
- Aviso novo em KNOWN-ISSUES: programas de geração de quadros e outras camadas OpenXR de terceiros (por exemplo o OFXR Bridge) podem derrubar o Dolphin ao iniciar o jogo.

## Atualizando

Rode `instalar-smg-vr.bat` de novo, com o Dolphin fechado. As suas configurações (`smgvr-menu.ini`) são mantidas.

---

# Versão 1.2 (MCassador)

Conversas, voos, nado, arraia, sons e agachar de verdade.

## O que mudou

- **Primeira pessoa nas conversas, cenas e saídas de planeta.** O jogo não puxa mais a câmera para a terceira pessoa. Menu, aba **Jogo**: *Ficar em 1ª pessoa nas cenas* (padrão: sim).
- **Conversas melhores:** a caixa de diálogo fica mais baixa (menu: *Caixa de dialogo*), o botão **A** aparece perto de quem fala, os botões Sim/Não ficam acima da caixa e, em primeira pessoa, dá para conversar de mais longe (2×).
- **Arraia (fases de surfe):** a câmera não afunda mais na água quando a água-viva mergulha, e a arraia e a bola de rolar agora se guiam pelo **analógico esquerdo**.
- **Estrela Vermelha (voo):** sem o brilho branco nas mãos; o Mario vira para onde o **controle direito** aponta (ou para onde a **cabeça** olha) e o analógico esquerdo sobe e desce. Menu, aba **Jogo**: *Direção (voo e nado)*.
- **Nado debaixo d'água:** a mesma direção por cabeça ou controle direito, e o filtro de ondulação da água do jogo, que balançava a câmera em VR, foi desligado.
- **Mario Mola:** a câmera fica suave nos pulinhos.
- **Voos rápidos** (estrela de lançamento, arraia): a primeira pessoa não pisca mais quando a câmera do jogo fica para trás.
- **Agachar de verdade:** abaixe a cabeça uns 30 cm e o Mario agacha (é o botão Z). Menu, aba **Jogo**: *Agachar de verdade* (padrão: ligado). Não vale nadando, voando nem conversando.
- **Sons:** *Som dos fragmentos de estrela* e *Som das Lumas* podem ser desligados no menu (aba **Jogo**).
- **Menu:** a aba **Controles** ganhou uma segunda página (voo, arraia, bola, conversa).

## Atualizando

Rode `instalar-smg-vr.bat` de novo, com o Dolphin fechado. O seu `smgvr-menu.ini` é mantido; as opções novas entram com os valores padrão.

---

# Versão 1.1 (MCassador)

Ajustes de câmera em primeira pessoa e novas configurações padrão.

## O que mudou

- **O corpo não aparece mais na frente da câmera** ao pular, andar, correr, empurrar uma parede ou subir ladeiras. A câmera vai sozinha um pouco mais para a frente enquanto o Mario se move e volta quando ele para (parado, tudo continua como antes).
- **Opção nova no menu** (aba Câmera): *Câmera à frente: andando/pulando*, de 0 a +40 cm (padrão +20 cm).
- **Em ladeiras e planetas inclinados** a câmera acompanha a inclinação do corpo, até uns 15 cm.
- **Balanço de cipó:** o corpo fica sólido, o buraco do pescoço não aparece mais, e ao soltar o cipó a câmera não fica mais abaixo do chão (aparecia o fundo do espaço).
- **Interior da cabeça** no início de pulos: o corte de proximidade da câmera passou de 5 para 22 cm.
- **Novos valores padrão** de câmera (altura +5 cm, frente +5 cm, corte de objetos forte, HUD menor), os mesmos do autor.

## Atualizando da versão 1

Rode `instalar-smg-vr.bat` de novo, com o Dolphin fechado. Se o seu `smgvr-menu.ini` for o da versão 1, ele é trocado pelos novos padrões e o antigo fica guardado como `smgvr-menu.ini.bak-<hora>` na mesma pasta (`Documentos\Dolphin Emulator\SMG-VR`). Se você já tem a versão 1.1, as suas configurações são mantidas.

---

# Versão 1 (MCassador)

Primeira versão pública do Super Mario Galaxy VR.

## O que vem

- Primeira pessoa com corpo, braços e luvas do Mario nos controles.
- Câmera 200 e terceira pessoa (com colisão contra pedras e paredes e suavidade ajustável).
- Menu dentro do óculos (B + Y), com escolha de 60, 90 ou 120 quadros por segundo (vale ao reabrir o jogo).
- Sem reflexos e refração de tela; corte de objetos pela direção da cabeça (opcional).
- Correções de balanço, voos entre planetas, quedas e rolagens, tela de perfil e mapa do observatório.
- Tela de abertura própria.

## Padrões desta versão

- Quadros por segundo: **60** (velocidade normal do jogo).
- Corte de objetos: desligado.
- Suavidade da câmera: Suave.

## Instalação

Veja [INSTALL.md](INSTALL.md). Extraia o pacote em qualquer pasta, feche o Dolphin e execute `instalar-smg-vr.bat` (tudo é automático).
