#テーブル設計

##userテーブル##

| Colum             | Type   | Options    |
| ----------------- | ------ | ---------- |
| email             | string | null:false, unique: true | 
| encrypted_paaword | string | null:false |
| name              | string | null:false |
| profile           | text   | null:false |
| occupation        | text   | null:false |
| position          | text   | null:false |

### Association
-has_many :prototype
-has_many :comments

##prototypeテーブル##
| Colum      | Type       | Options    |
| ---------- | ---------- | ---------- | 
| title      | string     | null:false |
| catch_copy | text       | null:false | 
| concept    | text       | null:false |
| user       | references | null:false, foreign_key: true | 

### Association
-belongs_to :user


##commentsテーブル##
| Colum     | Type       | Options    |
| --------- | ---------- | ---------- |
| content   | text       | null:false | 
| prototype | references | null:false, foreign_key: true | 
| user      | references | null:false, foreign_key: true | 

###association
-belongs_to :prototype
-belomgs_to :user
