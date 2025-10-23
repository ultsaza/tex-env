# tex-env

## description

latexの執筆環境を構築する

https://github.com/James-Yu/LaTeX-Workshop のホットリロード機能を利用して文書のビルドを行う

## requirements

nixとdirenvが入っていれば大丈夫そう（後に詳細に書く）

## usage


初回のみ

```bash
direnv allow .
```

以降は

```bash
code .
```

でdirenv拡張により環境が読み込まれた状態でVSCodeが起動する.

