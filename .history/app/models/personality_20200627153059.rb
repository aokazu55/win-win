class Personality < ActiveHash::Base
	include ActiveHash::Associations
	self.data = [
		{id: 1, name: '真面目'}, {id: 2, name: '勤勉'}, {id: 3, name: '気が利く'},
		{id: 4, name: 'さわやか'}, {id: 5, name: '社交的'}, {id: 6, name: '目立ちたがり'},
		{id: 7, name: '信心深い'}, {id: 8, name: '謙虚'}, {id: 9, name: '優しい'},
		{id: 10, name: '繊細'}, {id: 11, name: '几帳面'}, {id: 12, name: 'しなやか'},
		{id: 13, name: '仕事大好き'}, {id: 14, name: '負けず嫌い'}, {id: 15, name: '世渡り上手'},
		{id: 16, name: '冷静'}, {id: 17, name: 'アクティブ'}, {id: 18, name: '子供っぽい'},
		{id: 19, name: '落ち着いてる'}, {id: 20, name: 'ケチ'}, {id: 21, name: '神経質'},
		{id: 22, name: '我慢強い'}, {id: 23, name: '地味'}, {id: 24, name: 'ポーカーフェイス'},
		{id: 25, name: '頑固'}, {id: 26, name: 'おしゃべり'}, {id: 27, name: 'おおらか'},
		{id: 28, name: 'おせっかい'}, {id: 29, name: '好奇心旺盛'}, {id: 30, name: 'ロマンチスト'},
		{id: 31, name: 'のんびり'}, {id: 32, name: 'お人好し'}, {id: 33, name: 'マイペース'},
		{id: 34, name: '泣き虫'}, {id: 35, name: '恥ずかしがり屋'}, {id: 36, name: 'ワイルド'},
		{id: 37, name: 'せっかち'}, {id: 38, name: '無邪気'}, {id: 39, name: 'わがまま'},
		{id: 40, name: '自由気まま'}, {id: 41, name: '不器用'}, {id: 42, name: 'おおざっぱ'},
		{id: 43, name: 'お調子者'}, {id: 44, name: 'ぐうたら'}, {id: 45, name: '一匹狼'},
		{id: 46, name: '引っ込み思案'}, {id: 47, name: '優柔不断'}, {id: 48, name: '度胸がある'},
		{id: 49, name: '疑い深い'}, {id: 50, name: '騙されやすい'}, {id: 51, name: 'サバサバしている'},
		{id: 52, name: '執着心が強い'}, {id: 53, name: '八方美人'}, {id: 54, name: '傲慢'},
		{id: 55, name: '適当'}, {id: 56, name: 'ひょうきん'}, {id: 57, name: '臆病'},
		{id: 58, name: '短気'}, {id: 59, name: '二重人格'}, {id: 60, name: '嘘つき'},
		{id: 61, name: '自己中心的'}, {id: 62, name: '一本気'}, {id: 63, name: 'メンヘラ'},
		{id: 64, name: '生真面目'}, {id: 65, name: '思いやりがある'}, {id: 66, name: '用心深い'}
	]

	has_many :profiles

	def users
	profiles.map(&:user)
	end
end