# Flutter Tic Tac Toe

[![Language: Dart](https://img.shields.io/badge/Language-Dart-0175C2)](https://github.com/kleberandrade/tic-tac-toe-flutter/blob/master/pubspec.yaml)
[![Framework: Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)](https://github.com/kleberandrade/tic-tac-toe-flutter/blob/master/pubspec.yaml)

Flutter tic-tac-toe classroom app with tutorial material.

## Getting started

- Select a Flutter release whose bundled Dart SDK satisfies the manifest constraint, then run the commands below from the repository root.

```sh
flutter pub get
flutter run
```

- If the app depends on Firebase or another external service, configure your own service project using the dependencies and original notes; credentials are not supplied by this guide.

## Recorded requirements

- Dart SDK constraint from [`pubspec.yaml`](https://github.com/kleberandrade/tic-tac-toe-flutter/blob/master/pubspec.yaml): `>=2.7.0 <3.0.0`.

## Repository map

- [lib](https://github.com/kleberandrade/tic-tac-toe-flutter/tree/master/lib)
- [test](https://github.com/kleberandrade/tic-tac-toe-flutter/tree/master/test)
- [android](https://github.com/kleberandrade/tic-tac-toe-flutter/tree/master/android)
- [ios](https://github.com/kleberandrade/tic-tac-toe-flutter/tree/master/ios)

## Validation status

This update documents the tracked source and project metadata. It does not certify a successful build, device test or compatibility with a current toolchain. Follow any project-specific validation instructions in the original material.

## License and attribution

No standalone repository-wide license file was identified in this review. Preserve the original credits and any component-specific licenses; this documentation update grants no additional rights.

---

## Original project material

# Tic Tac Toe

Jogo da velha (Tic Tac Toe) criado para disciplina de Programação Mobile, criado por Kleber de Oliveira Andrade

Tutorial de criação deste app: [clique aqui](https://medium.com/@kleberandrade/criando-um-jogo-da-velha-em-flutter-50347537c926)

<p align="center">
    <img src="https://miro.medium.com/max/334/1*mEhyVlhIPQ3ccv9piPEdrw.png" width="250"/>
    <img src="https://miro.medium.com/max/334/1*mqMhhPAmNoY_ch1AAvJgeg.png" width="250"/>
    <img src="https://miro.medium.com/max/334/1*IXXSxfLfRDKCXw_QKw5yvQ.png" width="250"/>
</p>

## Como clonar o projeto

*   Faça um fork do projeto (precisa ter uma conta no github)
*   Abra o terminal do Visual Studio Code
*   Acesse a pasta onde deseja salvar o aplicativo e digite: git clone *link_do_projeto_no_seu_github* **tictactoe**
*   Clique em File --> Open e abra o projeto
*   Não se esqueça de abrir o arquivo *pubspec.yaml* e salvar (CTRL + S) o arquivo para que os plugins sejam baixados 

## Desafio para aula

*   [ ] Exibir o jogador da vez (Turno do X ou Turno do Y); Pode usar um Text para isso.
*   [ ] Criar um placar de vitórias para cada jogador; Pode usar Text também
*   [ ] Criar uma splash screen para o aplicativo; Utilize o [plugin custom_splash](https://pub.dev/packages/custom_splash).
*   [ ] Adicionar um botão para compartilhar o aplicativo. Utilize o [plugin Share](https://pub.dev/packages/share).
*   [ ] Trocar o X e Y por duas imagens (exemplo: Finn e Jake de Adventure Time) — como [utilizar imagens](https://flutter.dev/docs/development/ui/assets-and-images). Entendendo como colocar [imagens em um Container](https://medium.com/flutteropen/flutter-widgets-03-image-558e2b24059e).

## Licença

    Copyright 2020 Kleber de Oliveira Andrade
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
