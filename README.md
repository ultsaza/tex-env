# tex-env

## description

latexの執筆環境を構築する

https://github.com/James-Yu/LaTeX-Workshop のホットリロード機能を利用して文書のビルドを行う

## requirements

nixとdirenvが入っていれば大丈夫そう（後に詳細に書く）

## usage

`flake.nix`の`system`を使用しているアーキテクチャに合わせて変更する

初回のみ

```basｗ
direnv allow .
nix develop
```

以降は

```bash
code .
```

パッケージを追加する際は`flake.nix`に追記し
```bash
nix develop
```
を実行する

でdirenv拡張により環境が読み込まれた状態でVSCodeが起動する.

