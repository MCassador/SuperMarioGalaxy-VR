# Instalação

## O que você precisa

- Windows 10/11 x64 com uma boa placa de vídeo.
- Meta Quest 3 com Virtual Desktop (ou outro óculos com runtime OpenXR; testado só no Quest 3 com Virtual Desktop).
- **Dolphin VR Redux** de iChris4 (https://github.com/iChris4/dolphinXR), build com OpenXR (ramo *openxr-work*). O mesmo usado nos testes deste mod.
- A **sua** cópia do Super Mario Galaxy, versão americana (RMGE01). As versões europeia e japonesa não funcionam.

## Passo a passo

1. Feche o Dolphin.
2. Extraia o pacote em **qualquer pasta** (por exemplo, na Área de Trabalho). Só se o seu Dolphin for **portátil** (existe um `portable.txt` ao lado do `Dolphin.exe`) é que o pacote deve ser extraído dentro da pasta do Dolphin.
3. Dê dois cliques em `instalar-smg-vr.bat`. **Tudo é automático**, não pergunta nada. Ele:
   - acha sozinho a pasta de usuário do Dolphin (portátil, registro, Documentos ou AppData);
   - cria a pasta `Documentos\Dolphin Emulator\SMG-VR` e copia para lá a camada VR e a configuração;
   - registra a camada OpenXR (chave `HKCU\SOFTWARE\Khronos\OpenXR\1\ApiLayers\Implicit`);
   - instala os códigos do jogo (`GameSettings\RMGE01.ini`), os ajustes de VR (`GameSettingsVR\RMGE01.ini`) e os controles;
   - liga os cheats do Dolphin (sem isso os códigos não rodam);
   - guarda cópias de segurança do que substituiu na pasta `Backup` do Dolphin.
4. Conecte o Quest ao PC (Virtual Desktop, Air Link ou Link), abra o Dolphin VR ReduX e inicie o Super Mario Galaxy (versão americana).

## Usando junto com o mod do Super Mario Galaxy 2

Os dois mods usam a mesma camada VR (`smgvr_layer.dll`) e podem ficar instalados no mesmo Dolphin: cada jogo tem os seus próprios códigos e configurações. Pode instalar um depois do outro, em qualquer ordem: o instalador nunca troca uma DLL mais nova por uma mais antiga. Mod do Galaxy 2: https://github.com/MCassador/SuperMarioGalaxy2-VR

## Usando

- **Trocar de câmera:** clique do analógico direito (primeira pessoa → câmera 200 → terceira pessoa). A troca só responde depois que o jogo entrou na fase.
- **Menu do mod:** segure **B + Y**. Analógico para cima/baixo escolhe a linha, para os lados troca de aba, A muda o valor.
- **Quadros por segundo:** aba **Jogo** → **Quadros/s** (60, 90 ou 120). Vale ao reabrir o jogo. Use 60 para a velocidade normal do jogo.
- **Tela de abertura:** a imagem `smgvr-splash.bmp` em `Documentos\Dolphin Emulator\SMG-VR` aparece por alguns segundos ao iniciar. Apague ou troque o arquivo se quiser.

## Se algo der errado

Envie estes dois arquivos:

- `Documentos\Dolphin Emulator\SMG-VR\smgvr.log`
- `Dolphin Emulator\Logs\dolphin.log` (dentro da pasta de usuário do Dolphin)

## Desinstalar

1. Apague a pasta `Documentos\Dolphin Emulator\SMG-VR`.
2. Remova a chave de registro: `reg delete "HKCU\SOFTWARE\Khronos\OpenXR\1\ApiLayers\Implicit" /v "%USERPROFILE%\Documents\Dolphin Emulator\SMG-VR\smgvr_layer.json" /f`
3. Para voltar à configuração anterior, restaure os arquivos da pasta `Backup` da pasta de usuário do Dolphin.
