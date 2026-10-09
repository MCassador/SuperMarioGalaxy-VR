# Super Mario Galaxy VR

**Versão 1.6** · Windows x64 · Dolphin VR ReduX · OpenXR · Meta Quest 3 (Virtual Desktop)

O **Super Mario Galaxy** (versão americana, RMGE01) em realidade virtual, dentro do Dolphin VR ReduX:
primeira pessoa com o corpo, os braços e as luvas do Mario nos seus controles, três câmeras e um
menu dentro do óculos.

[Instalação](INSTALL.md) · [Problemas conhecidos](KNOWN-ISSUES.md) · [Créditos](CREDITS.md) · [Notas da versão](RELEASE_NOTES.md)

> Este pacote **não** contém o jogo nem o Dolphin. Você precisa da sua própria cópia do Super Mario Galaxy
> e do Dolphin VR Redux de **iChris4** (build com OpenXR, ramo *openxr-work*: https://github.com/iChris4/dolphinXR).

## As três câmeras

Clique no analógico direito (R3) para trocar, sempre nesta ordem:

| Câmera | Como é |
| --- | --- |
| **Primeira pessoa** | Você vê pelos olhos do Mario. As luvas e os braços seguem os seus controles. |
| **Câmera 200** | Câmera atrás do Mario, horizonte reto, distância ajustável com o analógico direito. |
| **Terceira pessoa** | Segue a câmera do jogo, nivelada, desvia de pedras e paredes, com suavidade ajustável. |

## O que o mod faz (por MCassador)

- Mãos e luvas do próprio Mario seguindo os controles (e escolhendo a pose da luva pelos dedos, quando o óculos rastreia as mãos).
- Menu dentro do óculos: **segure B + Y**. Câmeras, mãos, luvas, corte de objetos, quadros por segundo e tamanho do HUD.
- Sem os reflexos e a refração de tela que quebram em VR (água, gelo, cristais).
- Corte de objetos pela direção da cabeça, para ganhar FPS (vem ligado em "forte"; dá para mudar ou desligar no menu).
- Correções de câmera para balanço de cipó, voos entre planetas, quedas e rolagens (o corpo não passa na frente da câmera), tela de perfil e mapa do observatório.
- Ao andar, correr, pular e subir ladeiras a câmera vai um pouco mais para a frente sozinha, para o corpo inclinado do Mario não aparecer na sua frente. A distância é ajustável no menu (aba Câmera: *Câmera à frente: andando/pulando*).
- Fica em primeira pessoa nas conversas, cenas e saídas de planeta; a caixa de diálogo fica mais baixa, o botão A e o Sim/Não aparecem em primeira pessoa e dá para conversar de mais longe.
- Voo da Estrela Vermelha e nado debaixo d'água guiados pela cabeça ou pelo controle direito (menu, aba Jogo); arraia e bola de rolar pelo analógico esquerdo.
- Agachar de verdade (opcional): abaixe a cabeça e o Mario agacha. Desligado, a altura da câmera se recentraliza sozinha quando você senta ou levanta.
- Corte por distância, giro suave do analógico direito (opcional) e menu em português e inglês.
- Dá para desligar o som dos fragmentos de estrela e das Lumas no menu.
- Pausa com um toque no botão Menu do controle esquerdo.
- Tela de abertura própria (`smgvr-splash.bmp`, você pode trocar a imagem).

## Dica importante: FPS e velocidade do jogo

O Galaxy conta o tempo em quadros. Rodando a 90 FPS ele fica 50% mais rápido; quando o FPS cai, fica em câmera lenta.
Este pacote já vem em **60 quadros** (velocidade normal e estável). Para mudar: menu do mod (B + Y) → aba **Jogo** → **Quadros/s** → reabra o jogo.
A opção **Velocidade do jogo em FPS alto** (mesma aba) vem em *Acelera com o FPS*; escolha *Normal (60 passos/s)* para manter a velocidade normal com 72 ou mais quadros.

## Controles (Quest)

| Wii | Quest |
| --- | --- |
| Analógico (Nunchuk) | analógico esquerdo |
| A | botão A (direito) |
| B | gatilho direito |
| Z / C | gatilho esquerdo / grip esquerdo |
| Trocar de câmera | clique do analógico direito |
| Pausa (+) | botão Menu (esquerdo), toque rápido |
| Giro do Mario | movimento do controle |
| Voo (Estrela Vermelha) e nado | virar: controle direito ou cabeça (menu); analógico esquerdo: subir e descer (voo) |
| Agachar | gatilho esquerdo, ou abaixe a cabeça de verdade |
| Menu do mod | segurar B + Y |

Feito por **MCassador**. Projeto de fã, sem fins lucrativos e sem relação com a Nintendo.
