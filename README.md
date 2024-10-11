# WordPress環境構築 Terraform 設定

このプロジェクトは、Terraformを使用してAWS上にWordPress環境を構築するための設定です。
RDSは使用せず、EC2インスタンス上にMySQLデータベースをセットアップしてWordPressを動作させます。
CloudFrontおよびWAFは後から追加予定です。

## ディレクトリ構成

```
project-directory/
│
├── main.tf                  # メインのエントリーポイント
├── variables.tf             # 変数定義ファイル
├── outputs.tf               # 出力定義ファイル
├── vpc/
│   ├── vpc.tf               # VPC関連のリソース
│   ├── subnets.tf           # サブネット関連のリソース
│   └── security-groups.tf   # セキュリティグループの設定
├── ec2/
│   └── ec2.tf               # EC2インスタンスの設定
└── README.md                # このREADMEファイル
```

## 必要条件

- Terraform 1.x
- AWS CLI（認証済みの設定）
- AWSアカウント

## 使用方法

### 1. Terraformのインストール

Terraformがインストールされていない場合は、公式サイト（[https://www.terraform.io/downloads](https://www.terraform.io/downloads)）からダウンロードし、インストールしてください。

### 2. AWS認証の設定

AWS CLIを使用してAWSの認証情報を設定してください。以下のコマンドでAWSアカウントにログインします。

```bash
aws configure
```

### 3. 変数の設定

`variables.tf`に必要な変数が定義されています。必要に応じて、カスタマイズします。

### 4. Terraformの初期化

以下のコマンドを実行してTerraformを初期化します。

```bash
terraform init
```

### 5. プランの確認

リソースが正しく作成されるか確認するため、以下のコマンドでプランを表示します。

```bash
terraform plan
```

### 6. リソースの作成

問題がなければ、以下のコマンドを実行してリソースを作成します。

```bash
terraform apply
```

プロンプトが表示されたら、`yes`と入力して実行を続けます。

### 7. アクセス確認

Terraformが正常に完了したら、EC2インスタンスのパブリックIPが出力されます。ブラウザで以下のURLにアクセスしてWordPressのセットアップを開始します。

```
http://<EC2のパブリックIP>/
```

## ファイルの説明

- `main.tf`: Terraformのメインエントリーポイントです。必要に応じてモジュールやリソースをインクルードします。
- `variables.tf`: プロジェクト内で使用する変数を定義します。
- `outputs.tf`: 実行後に表示される出力を定義します（EC2のパブリックIPなど）。
- `vpc/`: VPC関連の設定ファイルです。サブネットやセキュリティグループもここに配置されます。
- `ec2/`: EC2インスタンスの設定ファイルです。WordPressをホストするインスタンスが定義されています。

## 注意点

- データベースはEC2インスタンス上にセットアップされるため、セキュリティを十分に考慮してください。
- 現在はWAFおよびCloudFrontの設定は含まれていませんが、後から追加することが可能です。

## 今後の追加予定

- CloudFrontの設定
- WAFの設定
- SSL/TLS証明書の適用
