class SpecialSkill < ActiveHash::Base
	include ActiveHash::Associations
	self.data = [
		{id: 1, name: '家事'}, {id: 2, name: '料理'}, {id: 3, name: '掃除'},
		{id: 4, name: '手芸'}, {id: 5, name: '習字'}, {id: 6, name: '家具製作'},
		{id: 7, name: '倹約・節約'}, {id: 8, name: '何かの目利き'}, {id: 9, name: '着付け'},
		{id: 10, name: '記憶'}, {id: 11, name: '味覚'}, {id: 12, name: '計算'},
		{id: 13, name: 'コミュニケーション能力'}, {id: 14, name: '体力・筋力・身体能力'}, {id: 15, name: '何かの知識'},
		{id: 16, name: '手先が器用'}, {id: 17, name: '思考'}, {id: 18, name: '分析'},
		{id: 19, name: '勉強'}, {id: 20, name: 'おはなし'}, {id: 21, name: '囲碁・将棋・チェス'},
		{id: 22, name: '書道・花道'}, {id: 23, name: '読書・速読'}, {id: 24, name: '語学'},
		{id: 25, name: '楽器演奏'}, {id: 26, name: 'ゲーム'}, {id: 27, name: '絵画・イラスト'},
		{id: 28, name: '歌'}, {id: 29, name: 'ダンス・舞踊'}, {id: 30, name: '文章作成'},
		{id: 31, name: '動画制作'}, {id: 32, name: 'スポーツ'}, {id: 33, name: 'パソコン・WEB'},
		{id: 34, name: '娯楽'}, {id: 35, name: '文化・知識'}, {id: 36, name: '歴史・知識'},
		{id: 37, name: 'アウトドア'}, {id: 38, name: '釣り'}, {id: 39, name: 'ゴルフ'},
		{id: 40, name: '洋裁'}, {id: 41, name: '買い物'}, {id: 42, name: 'お笑い'},
		{id: 43, name: '占い'}, {id: 44, name: 'クイズ'}, {id: 45, name: '一人旅'},
		{id: 46, name: '鉄道'}, {id: 47, name: '写真撮影'}, {id: 48, name: 'モノマネ'},
		{id: 49, name: '百人一首・かるた'}, {id: 50, name: 'プラモデル'}, {id: 51, name: '大食い・早食い'},
		{id: 52, name: 'プログラミング'}, {id: 53, name: '植木'}, {id: 54, name: '飼育'},
		{id: 55, name: 'サバイバル'}, {id: 56, name: 'クイズ'}, {id: 57, name: 'コーディネイト'},
		{id: 58, name: '射的'}, {id: 59, name: 'あやとり'}, {id: 60, name: 'ドローン操縦'},
		{id: 61, name: 'UFOキャッチャー'}, {id: 62, name: 'プラモデル'}
	]
	has_many :profiles

	def users
	profiles.map(&:user)
	end
end