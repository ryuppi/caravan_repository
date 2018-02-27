class BlogsController < ApplicationController
	def index
		@blog = Blog.all
	end

	def show
		@blog = Blog.find(params[:id])
		#findメソッドはidを使ってモデルからレコードを探す
	end

	def new
		@blog = Blog.new
		#ブログモデルと紐付いた（データを入れるための）からの箱を定義
		#インスタンス変数
	end

	def create
		#ストロングパラメータを使用 rails３以降？は直接入れるとエラーが出る
		blog = Blog.new(blog_params)
		#データベースへ保存
		blog.save
		#新規投稿画面へリダイレクト
		#redirect_to "/blogs"
		redirect_to blog_path(blog.id)
	end

	private

	def blog_params
		params.require(:blog).permit(:title, :body, :category)
		#Viewからそうしんされたデータはparamsというメソッドの中に入っている
	end
end