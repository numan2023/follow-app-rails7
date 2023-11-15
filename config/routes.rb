Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets, only: [:index, :new, :create]
  resources :users do # ネスト
    resource :relationships, only: [:create, :destroy]
  end
end

# resourcesとresoureの違い -> それぞれがどのようにRESTfulリソースを表すかにある。

#   - resources：複数のレコードを扱い場合に使用。CRUD(create, read, update, delete)操作のためのルーティングが含まれる
#       index(表示), new(新規作成フォームの表示), create(新規作成), edit(編集フォームの表示), update(更新), show(特定表示), destroy(削除)などのアクションへのルートを生成
#   - resource：一つの特定のリソースを扱う場合に使用。例）userが一つのrelationshioレコードのみ持つことを意味。つまり各ユーザーの自分自身の関係を作成(create, destroy, show)し、全ユーザーの関係のリストを表示(index)することはない