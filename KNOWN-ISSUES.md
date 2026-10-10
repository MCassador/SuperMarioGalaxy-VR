# Problemas conhecidos

- **Só a versão americana** do jogo (RMGE01).
- **Velocidade do jogo = FPS.** O Galaxy avança um passo por quadro. O pacote vem em 60 quadros para ter velocidade normal. Se o seu PC não segurar 60, o jogo fica um pouco mais lento nos trechos pesados.
  Com mais de 60 quadros, a opção *Velocidade do jogo em FPS alto* (padrão *Acelera com o FPS*) decide: *Acelera* roda o jogo 1,2× a 2× mais rápido; *Normal (60 passos/s)* mantém a velocidade (com um pequeno tranco entre 61 e 119 quadros).
- **FPS na terceira pessoa e na câmera 200** é menor que na primeira pessoa: o jogo desenha uma área maior. O corte de objetos (menu, aba Jogo) ajuda
  e vem em **forte** por padrão. Em primeira pessoa, o corte pela direção da cabeça dá uns 20 FPS a mais. Se algum objeto sumir, desligue ou deixe mais leve.
- **Quedas de FPS e travadas curtas** em carregamento de fase, voos entre planetas e áreas abertas cheias de objetos.
- **Formas do Mario** (Fantasma/Boo e Tornado): a primeira pessoa não foi ajustada para elas.
- **Agachar de verdade** usa a altura em que a sua cabeça estava ao centralizar a visão. Se a câmera estiver baixa demais ao agachar, desligue a opção no menu (aba **Jogo**).
- **Rastreamento de mãos** está no começo: o dedo escolhe a pose da luva (aberta, fechada, apontando...), mas os dedos ainda não se mexem um a um.
- **Cinemáticas e vídeos** usam uma tela fixa no espaço; podem aparecer pequenos erros de enquadramento.
- **Mod em desenvolvimento.** Se encontrar algo, envie o `smgvr.log` e diga o que estava fazendo.
- **Programas de geração de quadros e outras camadas OpenXR de terceiros** (por exemplo o OFXR Bridge) podem derrubar o Dolphin ao iniciar o jogo (queda sem mensagem logo depois de "Requesting API version" no `dolphin.log`). Desligue o programa ou coloque `Dolphin.exe` na lista de processos excluídos dele.
- **Novidades da 1.4 pouco testadas:** o corte por distância, o giro suave, o menu em inglês, o recentralizar da altura e os ajustes de câmera nos voos entre planetas foram testados só pelo autor e por pouco tempo.
- **Novidades da 1.5 pouco testadas:** a correção do rastro do braço ao girar e a imagem de abertura seguindo o recentralizar foram testadas pouco no Galaxy 1.
- **Novidades da 1.6 pouco testadas:** a HUD no pulso / na câmera 200 e a correção do corpo recolhido foram testadas pouco. Na pausa, o painel da HUD não some.
- **Novidades da 1.8:** o ponteiro livre foi pouco testado. Correndo, a animação do próprio jogo ainda balança o peito do Mario.
- **Novidades da 1.9:** o acerto do ponteiro de qualquer direção foi testado no Galaxy 2; no Galaxy 1 foi pouco testado.
