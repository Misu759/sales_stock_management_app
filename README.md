### サービス概要

小規模な飲食店の店主、従業員に向けて

売上や在庫データの管理をシンプルに行うことができ、業務改善に繋げるという価値を提供する

飲食店に特化した販売管理サービス

### メインのターゲットユーザー

個人経営など小規模な店舗の飲食店の店主、従業員

（飲食店を開業した友人に向けて作成中）

### ユーザーが抱える課題

- 売上の推移や過去のデータを記録できない
    - 現在はレジの集計機能によって1日ごとの売上個数、売上高を確認
- 食材/備品の発注漏れの危険性
    - 現在、在庫の減り具合をその都度確認して発注/買い出しを行っている
    - 確認不足・伝達ミスなどによって発注漏れが起きる
- 食材を何にどれだけ使ったか正確に把握できない
    - 予め決めた分量の食材を使用できているか（原価通り使用できているか）
        - 現在、各メニューに対する食材の分量は決めている
        - その分量を正確に使えているかを簡単に確認したい
    - 売上以外での食材使用量
        - 新メニューの試作を提供したり、賞味期限が迫った食材を無料で提供することがある
    - 余分な発注に気がつかない危険性

### 解決方法

- 売上の入力によって、食材使用量を記録する仕組みを提供
    - 入力はレジで算出できるメニューごとの売上個数
    - 在庫データの理論値を求めることによって、実際の在庫量との差から食材使用量の問題点を見つけるきっかけに
    - 発注が必要なタイミングでメッセージを表示して発注漏れを防ぐ

### 実装予定の機能

- 管理ユーザー
    - 従業員ユーザーの一覧、詳細、作成、編集、削除
    - 仕入れ先の一覧、作成、編集、削除
        - 連絡先、発注時の配送料を登録できる
    - 食材/備品の一覧、詳細、作成、編集、削除
        - 購入する際の単位（牛乳1000ml で150円など）で登録できる
        - 量の単位は{ ml, g, 枚 }
        - 仕入れ先の情報を関連づけて登録できる
        - アラートを出す閾値（この値を在庫量が下回った際にメッセージを表示する）を登録できる
    - メニューの一覧、詳細、作成、編集、削除
        - 定価、使用する食材とその分量を登録できる
        - メニューの原価、原価率を確認できる
    - 目標利益の一覧、詳細、作成、編集、削除
        - 日付、目標利益を登録可能

- 従業員ユーザー
    - 仕入れ先の一覧を確認できる
    - 食材/備品の一覧、詳細を確認できる
    - 食材/備品の在庫量を確認できる
    - メニューの一覧、詳細を確認できる
    - 目標利益の一覧、詳細を確認できる
    - 発注の一覧、詳細、作成、編集、削除
        - 食材（備品）名、個数、発注日、到着予定日を登録できる
        - 入力フォームは、仕入れ先を選択し、それに関連づく発注データを複数同時に登録できる
        - 登録後は、食材・仕入れ先のデータに基づく発注費を確認できる
        - 到着確認画面において、到着予定日が過ぎた発注データを確認できる
        - 到着確認ボタンを押すと、発注データに登録されている量がその食材の在庫に反映される
        - 発注一覧ページのグラフによって発注費・発注量を確認できる
        - 発注量のグラフは食材名によって絞り込みが可能
    - 売上の一覧、詳細、作成、編集、削除
        - 一覧ページのグラフによって売上高を確認できる（日別、週別、月別で切り替え可能）
        - 日付、各メニューに対する個数を入力することで、複数のレコードを同時に登録できる
        - 売上に対して、各メニューに登録している食材の使用量を計算し、在庫に反映される
        - 売上確認画面において、1日の売上高、営業利益、食材使用量を確認できる
        - 売上確認画面において、目標利益と比較して、営業日の振り返りを行うことができる
    - 売上外消費食材（試作/無料提供/廃棄食材）の一覧、詳細、作成、編集、削除
        - 食材名、量、日付を登録できる
        - 登録したデータは食材の在庫量に反映される
        - 一覧ページで確認できる

### なぜこのサービスを作りたいか

開業した友人を自分の得意な分野で協力し、応援したいと思ったので

どんな機能を望むのか明確な要求を聞くことができ、作成したものへ反応をもらえるのが楽しいと思ったので