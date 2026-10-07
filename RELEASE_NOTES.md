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
